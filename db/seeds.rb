# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar")

99.times do |n|
  first_name  = Faker::Name.first_name
  last_name =  Faker::Name.last_name
  username = Faker::FunnyName.name
  gender =Faker::Gender.binary_type
  date_of_birth = Faker::Date.birthday(min_age: 18, max_age: 65)
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  profile_image = Faker::Avatar.image

  
  User.create!(first_name:  first_name,
               last_name: last_name,
               username: username,
               gender: gender,
               date_of_birth: date_of_birth,
               profile_image: profile_image,
               email: email,
               password:              password,
               password_confirmation: password)
end

#posts
users = User.order(:created_at).take(6)
50.times do
  body = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(body: body) }
end