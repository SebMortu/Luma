import { supabase } from './supabaseClient.js'

export async function searchUsersByUsername(query, currentUserId) {
  if (!query || query.trim().length < 2) return []
  const { data, error } = await supabase
    .from('user_settings')
    .select('user_id, username, total_xp')
    .ilike('username', `%${query.trim()}%`)
    .neq('user_id', currentUserId)
    .limit(10)
  if (error) throw error
  return data || []
}

export async function sendFriendRequest(requesterId, addresseeId) {
  const { error } = await supabase.from('friendships').insert({
    requester_id: requesterId,
    addressee_id: addresseeId,
    status: 'pending',
  })
  if (error) throw error
}

export async function acceptFriendRequest(friendshipId) {
  const { error } = await supabase.from('friendships').update({ status: 'accepted' }).eq('id', friendshipId)
  if (error) throw error
}

export async function declineOrRemoveFriendship(friendshipId) {
  const { error } = await supabase.from('friendships').delete().eq('id', friendshipId)
  if (error) throw error
}

export async function getPendingRequests(userId) {
  const { data: requests, error } = await supabase
    .from('friendships')
    .select('id, requester_id')
    .eq('addressee_id', userId)
    .eq('status', 'pending')
  if (error) throw error
  if (!requests || requests.length === 0) return []

  const { data: profiles, error: profileErr } = await supabase
    .from('user_settings')
    .select('user_id, username')
    .in('user_id', requests.map((r) => r.requester_id))
  if (profileErr) throw profileErr

  const usernameByUserId = Object.fromEntries((profiles || []).map((p) => [p.user_id, p.username]))
  return requests.map((r) => ({ ...r, requesterUsername: usernameByUserId[r.requester_id] || '???' }))
}

/**
 * Récupère la liste d'amis (acceptés) + soi-même, triés par XP de la semaine
 * en cours — le classement à proprement parler.
 */
export async function getFriendsLeaderboard(userId) {
  const { data: friendships, error: friendErr } = await supabase
    .from('friendships')
    .select('requester_id, addressee_id')
    .eq('status', 'accepted')
    .or(`requester_id.eq.${userId},addressee_id.eq.${userId}`)
  if (friendErr) throw friendErr

  const friendIds = (friendships || []).map((f) => (f.requester_id === userId ? f.addressee_id : f.requester_id))
  const allIds = [...new Set([userId, ...friendIds])]

  const { data: profiles, error: profileErr } = await supabase
    .from('user_settings')
    .select('user_id, username, weekly_xp, weekly_xp_week_start, current_streak')
    .in('user_id', allIds)
  if (profileErr) throw profileErr

  const todayWeekStart = new Date()
  todayWeekStart.setDate(todayWeekStart.getDate() - ((todayWeekStart.getDay() + 6) % 7)) // lundi de cette semaine
  const weekStartStr = todayWeekStart.toISOString().slice(0, 10)

  const ranked = (profiles || [])
    .map((p) => ({
      ...p,
      weekly_xp: p.weekly_xp_week_start === weekStartStr ? p.weekly_xp : 0, // XP d'une semaine passée -> 0
    }))
    .sort((a, b) => b.weekly_xp - a.weekly_xp)

  return ranked
}
