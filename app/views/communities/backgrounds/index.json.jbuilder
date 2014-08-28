json.array!(@backgrounds) do |background|
  json.extract! background, :id, :room_id, :image, :name, :about, :user_id, :access, :community_id
  json.url background_url(background, format: :json)
end
