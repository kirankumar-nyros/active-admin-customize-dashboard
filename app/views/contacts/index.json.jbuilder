json.array!(@contacts) do |contact|
  json.extract! contact, :id, :Name, :Company, :Age, :Email, :Password
  json.url contact_url(contact, format: :json)
end
