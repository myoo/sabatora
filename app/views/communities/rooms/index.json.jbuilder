json.array!(@communities_rooms) do |communities_room|
  json.extract! communities_room, :id
  json.url communities_room_url(communities_room, format: :json)
end
