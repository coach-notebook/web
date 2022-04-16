# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user = FactoryBot.create(:user, email_address: "alice@example.com", password: "password")
FactoryBot.create_list(:library_with_plays_and_drills, 5, user: user)
FactoryBot.create_list(:squad_with_teams, 3, user: user)
Squad.all.each do |squad|
  FactoryBot.create_list(:practice, 5, squad: squad)
  squad.teams.each do |team|
    FactoryBot.create_list(:match, 5, team: team).each do |match|
      match.players = team.players
    end
  end
end
