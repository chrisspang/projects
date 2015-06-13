# lib/tasks/db.rake
namespace :db do
  desc 'Drop, create, migrate then seed the development database'
  task reseed: [ 'skip_prod', 'db:drop', 'db:migrate', 'db:seed' ]
end

# lib/tasks/db.rake
['db:drop', 'db:reset'].each do |t|
  Rake::Task[t].enhance ['skip_prod']
end
