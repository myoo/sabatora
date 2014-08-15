json.array!(@characters) do |character|
  json.extract! character, :id
  json.url character_url(character, format: :json)
end
