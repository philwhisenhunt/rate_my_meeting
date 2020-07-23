# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Generate ratings for a subset of users.
users = User.order(:created_at).take(6)
50.times do
    content = rand(11)
    users.each { |user| user.ratings.create!(content: content) }
end