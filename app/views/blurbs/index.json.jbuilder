json.array!(@blurbs) do |blurb|
  json.extract! blurb, :id, :datasource_id, :description
  json.url blurb_url(blurb, format: :json)
end
