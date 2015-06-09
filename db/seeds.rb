# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Datasource.destroy_all
Builder.destroy_all
Project.destroy_all
Blurb.destroy_all
Image.destroy_all

lipsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

puts "Destroyed all"

Datasource.create([
                   {
                     name: 'datasource_a',
                     title: 'Datasource A'
                   },
                   {
                     name: 'datasource_b',
                     title: 'Datasource B'
                   },
                   {
                     name: 'datasource_c',
                     title: 'Datasource C'
                   }
                  ])

puts "Datasources created"

Builder.create([
                {
                  name: "builder_a",
                  title: "Builder A"
                },
                {
                  name: "builder_b",
                  title: "Builder B"
                },
                {
                  name: "builder_c",
                  title: "Builder C"
                },
               ])

puts "Builders created"

Project.create([
                {
                  name: 'project_a',
                  title: 'Olive County',
                  verified: false,
                  latitude: 28.65910,
                  longitude: 77.37871,
                  builder: Builder.last,
                },
                {
                  name: 'project_b',
                  title: 'Sobha Forest View',
                  verified: false,
                  latitude: 12.87704,
                  longitude: 77.53069,
                  builder: Builder.all.at(1),
                },
                {
                  name: 'project_c',
                  title: 'Prestige Sunnyside',
                  verified: false,
                  latitude: 12.93212,
                  longitude: 77.69636,
                  builder: Builder.all.at(2),
                },
                {
                  name: 'project_d',
                  title: 'Sobha Halcyon',
                  verified: true,
                  latitude: 13.03311,
                  longitude: 77.76374,
                  builder: Builder.first,
                },
                {
                  name: 'project_e',
                  title: 'Divyasree Elan',
                  verified: false,
                  latitude: 12.91733,
                  longitude: 77.67288,
                  builder: Builder.first,
                },
                {
                  name: 'project_f',
                  title: 'NCR City',
                  verified: false,
                  latitude: 28.63416,
                  longitude: 77.47646,
                  builder: Builder.first,
                },
               ])

puts "Projects created"

Blurb.create([
              {
                datasource: Datasource.last,
                description: lipsum.titleize,
                project: Project.first,
              },
              {
                datasource: Datasource.first,
                description: lipsum,
                project: Project.first,
              },
              {
                datasource: Datasource.last,
                description: lipsum.downcase,
                project: Project.last,
              },
              {
                datasource: Datasource.first,
                description: lipsum.upcase,
                project: Project.last,
              },
             ])

puts "Blurbs created"

Image.create([
              {
                url: 'http://placehold.it/400x300?text=aaaa',
                blurb: Blurb.first
              },
              {
                url: 'http://placehold.it/400x300?text=bbbb',
                blurb: Blurb.first
              },
              {
                url: 'http://placehold.it/400x300?text=ccc',
                blurb: Blurb.last
              },
              {
                url: 'http://placehold.it/400x300?text=ddd',
                blurb: Blurb.last
              }
             ])

puts "Images created"

puts ""
puts "Created #{Image.count} Images"
puts "Created #{Blurb.count} Blurbs"
puts "Created #{Datasource.count} Datasources"
puts "Created #{Builder.count} Builders"
puts "Created #{Project.count} Projects"
