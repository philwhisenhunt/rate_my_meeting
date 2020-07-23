# Create a main sample user.
User.create!(name: "Example User",
            email: "example@example.com",
            password: "foobar",
            password_confirmation: "foobar")

# Generate ratings for a subset of users.
users = User.order(:created_at).take(6)
50.times do
    content = rand(11)
    users.each { |user| user.ratings.create!(content: content) }
end