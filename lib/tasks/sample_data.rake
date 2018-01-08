namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 email: "example@gmail.com",
                 password: "123456",
                 password_confirmation: "123456")
    
    User.create!(name: "Peter Pen", email: "ppen@mail.ru", password: "123456", password_confirmation: "123456")

    48.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@gmail.com"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  
    users = User.all

    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
    end



  end
end



