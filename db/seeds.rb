require 'random_data'

50.times do
  Wiki.create!(
    title:    Faker::Lorem.sentence,
    body:     Faker::Lorem.paragraph,
    private:  false
  )
end

admin = User.create!(
  email:    'admin@example.com',
  password: 'helloworld',
  password_confirmation: 'helloworld'
)

10.times do
  User.create!(
  email:    Faker::Internet.unique.email,
  password: Faker::Lorem.characters(6..10)
)
end

puts "Seed finished"
puts "#{Wiki.count} wikis created"
puts "#{User.count} users created"
