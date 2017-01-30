json.(@party, :name, :location)

json.guests do
  json.array! @party.guests do |guest|
    json.partial! 'api/guests/guest', guest: guest
    json.partial! 'api/guests/gifts', guest: guest 
  end
end
