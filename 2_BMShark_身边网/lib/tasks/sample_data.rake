namespace :db do
desc "Fill database with sample data"
task populate: :environment do

users = User.find(6)
50.times do
content = Faker::Lorem.sentence(5)
users.each { |user| user.merchandise.create!(content: content) }
end
end
end