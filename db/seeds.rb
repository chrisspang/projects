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

puts "Projects created"

Blurb.create([
              {
                datasource: Datasource.last,
                description: 'Here is some other blurb text - isnt it cool',
                project: Project.first,
              },
              {
                datasource: Datasource.first,
                description: 'And even more blurbies',
                project: Project.first,
              },
              {
                datasource: Datasource.last,
                description: 'Blurb part II',
                project: Project.last,
              },
              {
                datasource: Datasource.first,
                description: 'Blurb part II II',
                project: Project.last,
              },
             ])

puts "Blurbs created"

Image.create([
              {
                url: 'http://a.jpg',
                blurb: Blurb.first
              },
              {
                url: 'http://b.jpg',
                blurb: Blurb.first
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

puts "Images created"

puts ""
puts "Created #{Image.count} Images"
puts "Created #{Blurb.count} Blurbs"
puts "Created #{Datasource.count} Datasources"
puts "Created #{Builder.count} Builders"
puts "Created #{Project.count} Projects"
