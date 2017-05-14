require 'random_data'

50.times do
  Wiki.create!(
    title:    RandomData.random_sentence,
    body:     RandomData.random_paragraph,
    private:  false
  )
end

admin = User.create!(
  name:     'Admin User',
  email:    'admin@example.com',
  password: 'helloworld',
  password_confirmation: 'helloworld',
  confirm: true
)

puts "Seed finished"
puts "#{Wiki.count} wikis created"
