# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#
#
# Create a sample user with create!. This raises an exemption for an invalid user rather than returning false.

# Users
User.create!(name:                     "Example User",
             email:                    "example@railstutorial.org",
             password:                 "foobar",
             password_confirmation:    "foobar",
             admin:                    true,
             activated:                true,
             activated_at:             Time.zone.now)

# Create fake names with the Faker Gem utilizing a loop.
99.times do |n|
    name        = Faker::Name.name
    email       = "example-#{n+1}@railstutorial.org"
    password    = "password"
        User.create!(name:                  name,
                     email:                 email,
                     password:              password,
                     password_confirmation: password,
                     activated:             true,
                     activated_at:          Time.zone.now)
end

# Microposts
# Create fake microposts for users, enough to paginate...
users = User.order(:created_at).take(6)
50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
end

# Following relationships
users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
# In following.each user from (ln 45) 'follows' another with user.follow; those users are called 'followed' in the enumerable...
following.each { |followed| user.follow(followed) }
# In followers.each follower (a single user on ln 47's 'followers') follows user, which is the first user through user.first (ln 45)...
followers.each { |follower| follower.follow(user) }