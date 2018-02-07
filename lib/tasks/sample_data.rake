namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
  # make_users
  # make_categories
  make_microposts
  # posts_nah
  # make_relationships
  end
end

def make_users
  
User.create!(name: "Peter Pen", email: "ppen@mail.ru", password: "123456", password_confirmation: "123456")
User.create!(name: "Captain Hook", email: "hook@mail.ru", password: "123456", password_confirmation: "123456")

  User.create!(name: "Example User",
                 email: "example@gmail.com",
                 password: "123456",
                 password_confirmation: "123456")
    
  
  30.times do |n|
    name  = Faker::Name.name
    email = "example#{n+1}@gmail.com"
    password  = "123456"
    User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
  end
end

def make_categories
  categories = ["TravellHack", 
"On the wheels", 
"Travelling with kids", 
"Extrieme", 
"Asia", 
"Europe", 
"Latin America", 
"USA & Australia", 
"Russia", 
"Africa"]

categories.each do |category|
  Category.create(name: category)
end

end

def posts_nah
posts = Post.all

posts.each { |post| post.destroy }
end

def make_microposts
  users = User.all

    12.times do
      content = Faker::Lorem.sentences(15)
      title = Faker::Lorem.sentence(4)
      category = rand(1..10)
      users.each { |user| user.posts.create!(body: content, title: title, category_id: category) }
    end
end

def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end

