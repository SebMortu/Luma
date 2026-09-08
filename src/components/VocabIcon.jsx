// Affiche une vraie image si la valeur est un chemin d'image (commence par
// "/images/"), ou l'emoji tel quel sinon — permet de migrer progressivement
// les leçons de l'emoji vers de vraies illustrations sans casser le contenu
// existant qui n'a pas encore été mis à jour.
function VocabIcon({ value, size = 48, alt = '' }) {
  const isImage = typeof value === 'string' && value.startsWith('/images/')
  if (isImage) {
    return <img src={value} alt={alt} style={{ width: size, height: size, objectFit: 'contain' }} />
  }
  return <span style={{ fontSize: size * 0.7 }}>{value}</span>
}

export default VocabIcon
