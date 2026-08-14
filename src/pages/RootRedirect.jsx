import { useEffect, useState } from 'react'
import { Navigate } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'

function RootRedirect() {
  const { user } = useAuth()
  const [hasOnboarded, setHasOnboarded] = useState(null)

  useEffect(() => {
    async function check() {
      const { data } = await supabase
        .from('user_settings').select('active_language_id').eq('user_id', user.id).single()
      setHasOnboarded(!!data?.active_language_id)
    }
    check()
  }, [user.id])

  if (hasOnboarded === null) return <div className="page"><p>Chargement...</p></div>

  return hasOnboarded ? <Navigate to="/dashboard" replace /> : <Navigate to="/onboarding" replace />
}

export default RootRedirect
