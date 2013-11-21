json.array!(@places) do |place|
  json.extract! place, :title, :description, :address
  json.url place_url(place, format: :json)
end
