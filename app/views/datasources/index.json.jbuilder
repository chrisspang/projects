json.array!(@datasources) do |datasource|
  json.extract! datasource, :id, :name, :title
  json.url datasource_url(datasource, format: :json)
end
