json.array!(@projects) do |project|
  json.extract! project, :id, :name, :title, :verified, :latitude, :longitude, :builder_id
  json.url project_url(project, format: :json)
end
