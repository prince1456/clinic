# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |x|

  u = User.create(
    email:  Faker::Internet.email,
    password: "123456",
    role: ["doctor", "admin", "patient"].sample
  )
  p = Profile.create(
    first_name: Faker::Name.name,
    last_name: Faker::Vehicle.manufacture,
    user_id: u,
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRe8JXaIHDHwRUmF1A1QsRAYDgKbeQotyVeTgIagxs1huc1xSlMe4ncR_o"

  )

  b = Post.create(
    user_id: u,
    title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraph(2),
    author: Faker::Name.name,
    picture: "http://arwebzone.com/wp-content/uploads/2012/11/Sad-boy-facebook-Profile-Picture.jpg"
  )


end
