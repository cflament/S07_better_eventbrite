# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create seed for 10 first users
def user_seed
    User.destroy_all
    3.times do |t|
        u = User.create(
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            description: Faker::Lorem.sentence(word_count: 3, random_words_to_add: 4),
            email: "user#{t}@yopmail.com",
            password:  Faker::Internet.password
        )
        puts u.errors
    end
    puts "10 users created"
end
 user_seed 