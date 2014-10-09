json.array!(@communities_maps) do |communities_map|
  json.extract! communities_map, :id
  json.url communities_map_url(communities_map, format: :json)
end
