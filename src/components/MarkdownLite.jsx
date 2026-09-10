// Rendu léger d'un sous-ensemble de markdown utilisé dans le contenu des
// fiches de grammaire : tableaux (| col | col |), listes à puces (- item),
// listes numérotées (1. item), gras (**mot**) et italique (*mot*). Pas une
// bibliothèque markdown complète — juste ce dont ce contenu précis a besoin,
// pour éviter d'afficher des pipes/astérisques bruts à l'écran.

function renderInline(text, keyPrefix) {
  // Découpe en alternant texte normal / gras / italique. Le gras (**...**)
  // est traité AVANT l'italique (*...*) pour ne pas laisser d'astérisque
  // isolé — sinon "**mot**" est mal interprété par la règle italique seule.
  const parts = []
  let remaining = text
  let i = 0
  const pattern = /\*\*([^*]+)\*\*|\*([^*]+)\*/
  while (remaining.length > 0) {
    const m = remaining.match(pattern)
    if (!m) { parts.push(remaining); break }
    if (m.index > 0) parts.push(remaining.slice(0, m.index))
    if (m[1] !== undefined) parts.push(<strong key={`${keyPrefix}-${i++}`}>{m[1]}</strong>)
    else parts.push(<em key={`${keyPrefix}-${i++}`}>{m[2]}</em>)
    remaining = remaining.slice(m.index + m[0].length)
  }
  return parts
}

function parseTable(lines) {
  const parseRow = (line) => line.split('|').map((c) => c.trim()).filter((c, i, arr) => !(i === 0 && c === '') && !(i === arr.length - 1 && c === ''))
  const header = parseRow(lines[0])
  const rows = lines.slice(2).map(parseRow)
  return { header, rows }
}

function MarkdownLite({ text }) {
  const lines = text.split('\n').filter((l) => l.trim() !== '')

  const isTable = lines.length >= 2 && /^\|?[\s:|-]+\|[\s:|-]*$/.test(lines[1])
  if (isTable) {
    const { header, rows } = parseTable(lines)
    return (
      <div className="gr2-table-wrap">
        <table className="gr2-table">
          <thead><tr>{header.map((h, i) => <th key={i}>{h}</th>)}</tr></thead>
          <tbody>
            {rows.map((row, ri) => (
              <tr key={ri}>{row.map((cell, ci) => <td key={ci}>{renderInline(cell, `${ri}-${ci}`)}</td>)}</tr>
            ))}
          </tbody>
        </table>
      </div>
    )
  }

  const isBulletList = lines.length > 0 && lines.every((l) => l.trim().startsWith('- '))
  if (isBulletList) {
    return (
      <ul className="gr2-list">
        {lines.map((l, i) => <li key={i}>{renderInline(l.trim().slice(2), i)}</li>)}
      </ul>
    )
  }

  const isNumberedList = lines.length > 0 && lines.every((l) => /^\d+\.\s/.test(l.trim()))
  if (isNumberedList) {
    return (
      <ol className="gr2-list gr2-list-numbered">
        {lines.map((l, i) => <li key={i}>{renderInline(l.trim().replace(/^\d+\.\s/, ''), i)}</li>)}
      </ol>
    )
  }

  // Contenu mixte (ex: banque d'exemples numérotée suivie d'une ligne
  // "**Notions liées** → ...") : on sépare les lignes numérotées du reste,
  // pour garder chaque partie correctement formatée plutôt que de tout
  // basculer en paragraphes bruts dès qu'une seule ligne diffère du motif.
  const numberedLines = lines.filter((l) => /^\d+\.\s/.test(l.trim()))
  const otherLines = lines.filter((l) => !/^\d+\.\s/.test(l.trim()))
  if (numberedLines.length > 0 && otherLines.length > 0) {
    return (
      <>
        <ol className="gr2-list gr2-list-numbered">
          {numberedLines.map((l, i) => <li key={i}>{renderInline(l.trim().replace(/^\d+\.\s/, ''), i)}</li>)}
        </ol>
        {otherLines.map((l, i) => <p key={`o-${i}`}>{renderInline(l, `o-${i}`)}</p>)}
      </>
    )
  }

  return (
    <>
      {lines.map((l, i) => <p key={i}>{renderInline(l, i)}</p>)}
    </>
  )
}

export default MarkdownLite
