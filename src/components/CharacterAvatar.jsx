// Affiche un personnage dans un état émotionnel donné.
// Tant qu'aucune illustration n'est renseignée en base (image_*_url vide),
// un avatar placeholder (rond coloré + emoji) est utilisé automatiquement.
// Dès qu'une vraie image est ajoutée pour cet état, elle prend le relais
// sans aucune modification de code ailleurs dans l'app.

const STATE_IMAGE_FIELD = {
  neutral: 'image_neutral_url',
  happy: 'image_happy_url',
  celebrating: 'image_celebrating_url',
  thinking: 'image_thinking_url',
  sad: 'image_sad_url',
  waving: 'image_waving_url',
}

const STATE_ANIMATION_CLASS = {
  neutral: 'char-anim-idle',
  happy: 'char-anim-bounce',
  celebrating: 'char-anim-celebrate',
  thinking: 'char-anim-tilt',
  sad: 'char-anim-droop',
  waving: 'char-anim-wave',
}

function CharacterAvatar({ character, state = 'neutral', size = 64, className = '' }) {
  if (!character) return null

  const imageField = STATE_IMAGE_FIELD[state] || STATE_IMAGE_FIELD.neutral
  const imageUrl = character[imageField] || character[STATE_IMAGE_FIELD.neutral]
  const animClass = STATE_ANIMATION_CLASS[state] || STATE_ANIMATION_CLASS.neutral

  return (
    <div
      className={`character-avatar ${animClass} ${className}`}
      style={{ width: size, height: size, '--char-color': character.color }}
    >
      {imageUrl ? (
        <img src={imageUrl} alt={character.name} className="character-avatar-img" />
      ) : (
        <div className="character-avatar-placeholder" style={{ background: character.color }}>
          <span style={{ fontSize: size * 0.5 }}>{character.placeholder_emoji}</span>
        </div>
      )}
    </div>
  )
}

export default CharacterAvatar
