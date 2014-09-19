json.array!(@communities_illustrations) do |communities_illustration|
  json.extract! communities_illustration, :id, :Illustration
  json.url communities_illustration_url(communities_illustration, format: :json)
end
