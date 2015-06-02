json.array!(@builders) do |builder|
  json.extract! builder, :id, :name, :title
  json.url builder_url(builder, format: :json)
end
