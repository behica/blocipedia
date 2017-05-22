require 'random_data'

10.times do
  User.create!(
  email:    Faker::Internet.unique.email,
  password: Faker::Lorem.characters(6..10),
  role:     'standard',
  confirmed_at: DateTime.now
)
end

admin = User.create!(
  email:    'admin@example.com',
  password: 'helloworld',
  password_confirmation: 'helloworld',
  role:     'admin',
  confirmed_at: DateTime.now
)

premium = User.create!(
  email:    'member@example.com',
  password: 'helloworld',
  password_confirmation: 'helloworld',
  role:     'premium',
  confirmed_at: DateTime.now
)
  
standard = User.create!(
  email:    'user@example.com',
  password: 'helloworld',
  password_confirmation: 'helloworld',
  role:     'standard',
  confirmed_at: DateTime.now
)
users = User.all

50.times do
  Wiki.create!(
    user:     users.sample,
    title:    Faker::Lorem.sentence,
    body:     Faker::Lorem.paragraph,
    private:  false
  )
end

5.times do
  Wiki.create!(
    user:     users.sample,
    title:    Faker::Lorem.sentence,
    body:     Faker::Lorem.paragraph,
    private:  true
  )
end

puts "Seed finished"
puts "#{Wiki.count} wikis created"
puts "#{User.count} users created"
