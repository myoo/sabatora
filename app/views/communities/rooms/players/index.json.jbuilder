json.array!(@communities_rooms_players) do |communities_rooms_player|
  json.extract! communities_rooms_player, :id
  json.url communities_rooms_player_url(communities_rooms_player, format: :json)
end
