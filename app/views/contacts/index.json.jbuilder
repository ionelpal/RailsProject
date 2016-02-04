json.array!(@contacts) do |contact|
  json.extract! contact, :id, :firstname, :lastname, :emaill, :phone, :message
  json.url contact_url(contact, format: :json)
end
