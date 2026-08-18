import { useEffect, useState } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'

function BookReader() {
  const { bookId } = useParams()
  const { user } = useAuth()
  const navigate = useNavigate()

  const [book, setBook] = useState(null)
  const [page, setPage] = useState(null)
  const [pageNumber, setPageNumber] = useState(1)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)
  const [openBubbles, setOpenBubbles] = useState({})

  useEffect(() => {
    async function loadBook() {
      const { data: bookData, error: bookErr } = await supabase.from('books').select('*').eq('id', bookId).single()
      if (bookErr) { setError(bookErr.message); setLoading(false); return }
      setBook(bookData)

      const { data: progress } = await supabase
        .from('user_book_progress').select('*').eq('user_id', user.id).eq('book_id', bookId).maybeSingle()
      setPageNumber(progress?.current_page || 1)
    }
    loadBook()
  }, [bookId, user.id])

  useEffect(() => {
    if (!book) return
    async function loadPage() {
      setLoading(true)
      setOpenBubbles({})
      const { data, error: pageErr } = await supabase
        .from('book_pages').select('*').eq('book_id', bookId).eq('page_number', pageNumber).single()
      if (pageErr) { setError(pageErr.message); setLoading(false); return }
      setPage(data)
      setLoading(false)

      const completed = pageNumber >= book.total_pages
      await supabase.from('user_book_progress').upsert(
        { user_id: user.id, book_id: bookId, current_page: pageNumber, completed, updated_at: new Date().toISOString() },
        { onConflict: 'user_id,book_id' }
      )
    }
    loadPage()
  }, [book, pageNumber])

  const toggleBubble = (idx) => setOpenBubbles((prev) => ({ ...prev, [idx]: true }))
  const closeBubble = (idx) => setOpenBubbles((prev) => ({ ...prev, [idx]: false }))

  const goNext = () => { if (book && pageNumber < book.total_pages) setPageNumber((p) => p + 1) }
  const goPrev = () => { if (pageNumber > 1) setPageNumber((p) => p - 1) }

  if (error) return <div className="page"><p className="feedback incorrect">Erreur : {error}</p></div>
  if (!book) return <div className="page"><p>Chargement...</p></div>

  const progressPct = Math.round((pageNumber / book.total_pages) * 100)

  return (
    <div className="page book-reader-page">
      <div className="lesson-progress-top">
        <button className="lesson-back-icon" onClick={() => navigate('/books')} aria-label="Quitter">←</button>
        <div className="progress-bar-track" style={{ flex: 1 }}>
          <div className="progress-bar-fill" style={{ width: `${progressPct}%` }} />
        </div>
        <span className="verb-progress" style={{ marginLeft: 8 }}>{pageNumber} / {book.total_pages}</span>
      </div>

      <h1 className="book-reader-title">{book.title}</h1>

      {loading || !page ? (
        <p>Chargement de la page...</p>
      ) : (
        <div className="book-page-text-wrap">
          <div className="book-page-text">
            {page.sentences.map((s, idx) => (
              <span key={idx} className="book-sentence-wrap">
                <span
                  className="book-sentence"
                  onClick={() => toggleBubble(idx)}
                >
                  {s.en}{' '}
                </span>
                {openBubbles[idx] && (
                  <span className="book-translate-bubble">
                    🌐 {s.fr}
                    <button className="book-translate-close" onClick={() => closeBubble(idx)} aria-label="Fermer la traduction">
                      ▾
                    </button>
                  </span>
                )}
              </span>
            ))}
          </div>
        </div>
      )}

      <div className="book-nav-buttons">
        <button className="btn-secondary" onClick={goPrev} disabled={pageNumber <= 1}>← Page précédente</button>
        {pageNumber < book.total_pages ? (
          <button className="btn-primary" onClick={goNext}>Page suivante →</button>
        ) : (
          <button className="btn-primary" onClick={() => navigate('/books')}>Terminer le livre ✅</button>
        )}
      </div>
    </div>
  )
}

export default BookReader
