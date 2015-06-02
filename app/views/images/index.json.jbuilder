json.array!(@images) do |image|
  json.extract! image, :id, :url, :blurb_id
  json.url image_url(image, format: :json)
end
