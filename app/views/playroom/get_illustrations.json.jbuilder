json.array! @illustrations.each do |character_id, illustrations|
  json.character_id character_id
  json.set! :illustration_list do
    json.array! illustrations do |illustration|
      json.id illustration.id
      json.name illustration.name
      json.url illustration.image_url
    end
  end
end
