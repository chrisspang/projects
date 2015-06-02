# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Blurb.destroy_all
Datasource.destroy_all
Image.destroy_all

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

blurb = Blurb.create({
                    datasource: Datasource.first,
                    description: 'Here is some blurb text'
                  })

Blurb.create([
              {
                datasource: Datasource.last,
                description: 'Here is some other blurb text - isnt it cool'
              },
              {
                datasource: Datasource.first,
                description: 'And even more blurbies'
              },
             ])

Image.create([
              {
                url: 'http://a.jpg',
                blurb: blurb
              },
              {
                url: 'http://b.jpg',
                blurb: blurb
              },
              {
                url: 'http://c.jpg',
                blurb: Blurb.last
              },
              {
                url: 'http://d.jpg',
                blurb: Blurb.last
              }
             ])

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

Project.create([
                {
                  name: 'project_a',
                  title: 'Project A',
                  verified: false,
                  latitude: 1.0,
                  longitude: 2.0,
                  builder: Builder.last,
                },
                {
                  name: 'project_b',
                  title: 'Project B',
                  verified: true,
                  latitude: 10.0,
                  longitude: 20.0,
                  builder: Builder.first,
                }
               ])

puts "Created #{Image.count} Images"
puts "Created #{Blurb.count} Blurbs"
puts "Created #{Datasource.count} Datasources"
puts "Created #{Builder.count} Builders"
puts "Created #{Project.count} Projects"
