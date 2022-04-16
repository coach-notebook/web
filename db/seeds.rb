# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user = FactoryBot.create(:user)
FactoryBot.create_list(:library_with_plays_and_drills, 5, user: user)
FactoryBot.create_list(:squad, 5, user: user).each do |squad|
  FactoryBot.create_list(:practice, 5, squad: squad)
end
