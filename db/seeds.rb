# Create a main sample user.
User.create!(name:  "Example User",
             email: "example@example.org",
             password:              "foobar",
             password_confirmation: "foobar")

# Generate a bunch of additional users.
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@example.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
# Generate ratings for a subset of users.

users = User.order(:created_at).take(6)
# srand(time(0))
50.times do |i|
  # rating = rand(11)
  meeting_date = ((Date.today - 1) - i).to_s
  # meeting_date = "2020-06-18"
  # puts meeting_date
  # puts rand(1...11)
  users.each { |user| user.ratings.create!(rating: rand(1...11),
                                            meeting_date: meeting_date) }

end