# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@name_1 = "Neil Armstrong"
@age_1 = 49
@job_1 = "Commander"
@name_2 = "John Adams"
@age_2 = 104
@job_2 = "Touring"
@title_1 = "To the moon"
@time_1 = 47
@title_2 = "Alpha Centari"
@time_2 = 4
@astronaut_1 = Astronaut.create(name: @name_1, age: @age_1, job: @job_1)
@astronaut_2 = Astronaut.create(name: @name_2, age: @age_2, job: @job_2)
@mission_1 = Mission.create(title: @title_1, time_in_space: @time_1, astronauts: [@astronaut_1, @astronaut_2])
@mission_2 = Mission.create(title: @title_2, time_in_space: @time_2, astronauts: [@astronaut_1])
