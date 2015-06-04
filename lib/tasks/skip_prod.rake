# lib/tasks/skip_prod.rake
desc 'Raises exception if used in production'
task skip_prod: [:environment] do
  raise 'You cannot run this in production' if Rails.env.production?
end
