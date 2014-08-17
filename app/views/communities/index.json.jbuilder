json.array!(@communities) do |community|
  json.extract! community, :id, :name, :about, :description
  json.url community_url(community, format: :json)
end
