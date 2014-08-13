json.array!(@communities_joinings) do |communities_joining|
  json.extract! communities_joining, :id
  json.url communities_joining_url(communities_joining, format: :json)
end
