function DebugEnv() {
  const url = import.meta.env.VITE_SUPABASE_URL
  const key = import.meta.env.VITE_SUPABASE_ANON_KEY

  const maskedKey = key ? `${key.slice(0, 10)}...${key.slice(-6)} (longueur: ${key.length})` : 'MANQUANTE'

  return (
    <div style={{ padding: '2rem', fontFamily: 'monospace', color: '#f0efec', fontSize: '14px', lineHeight: 2 }}>
      <h1 style={{ marginBottom: '1rem' }}>Diagnostic des variables d'environnement</h1>
      <p><strong>VITE_SUPABASE_URL :</strong></p>
      <p style={{ wordBreak: 'break-all', background: '#262625', padding: '8px', borderRadius: '6px' }}>
        {url ? `"${url}"` : 'MANQUANTE (undefined)'}
      </p>
      <p><strong>VITE_SUPABASE_ANON_KEY :</strong></p>
      <p style={{ wordBreak: 'break-all', background: '#262625', padding: '8px', borderRadius: '6px' }}>
        {maskedKey}
      </p>
    </div>
  )
}

export default DebugEnv
