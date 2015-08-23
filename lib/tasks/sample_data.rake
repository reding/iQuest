namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

    make_questions
    make_relationships
  end
end
def make_users
  admin = User.create!(name: "Example User",
                       email: "example@railstutorial.org",
                       password: "foobar",
                       password_confirmation: "foobar",
                       admin: true)
  99.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    User.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password)
  end
end
def make_questions
  users = User.all
  5.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.questions.create!(title: content) }
  end
end
  def make_relationships
    users = User.all
    user = users.first
    followed_users = users[2..50]
    followers = users[3..49]
    followed_users.each { |followed| user.follow!(followed) }
    followers.each { |follower| follower.follow!(user) }
  end