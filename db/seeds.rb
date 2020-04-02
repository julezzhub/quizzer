# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Deleting everything"
  Bet.destroy_all
  MadeupAnswer.destroy_all
  User.destroy_all
  Round.destroy_all
  Game.destroy_all
  Room.destroy_all
  Question.destroy_all
  Deck.destroy_all


Deck.create!(name:"Vol. 1")

5.times do
  Question.create!(deck: Deck.find_by(name:"Vol. 1"), content: Faker::Quote.famous_last_words, solution: Faker::Beer.brand)
end

Room.create!(name:"Lobby")
testroom = Room.create!(name:"test", capacity: 6)

User.create!(email:"test@test.de", password:"testtest", username:"julez", room: Room.find_by(name:"test"))
User.create!(email:Faker::Internet.email, password:"testtest", username:Faker::Name.first_name, room: Room.find_by(name:"test"))
User.create!(email:Faker::Internet.email, password:"testtest", username:Faker::Name.first_name, room: Room.find_by(name:"test"))
User.create!(email:Faker::Internet.email, password:"testtest", username:Faker::Name.first_name, room: Room.find_by(name:"test"))


testgame = Game.create!(room: Room.find_by(name:"test"))

# Preparing a test game
game_questions = Question.where(deck: Deck.find_by(name: "Vol. 1")).sample(5)
counter = 0

5.times do
  Round.create!(game: Game.find_by(room: Room.find_by(name: "test")), question: game_questions[counter])
  counter += 1
end


# Letting the testusers give made up answers
Room.find_by(name:"test").users.each do |user|
  MadeupAnswer.create!(user: user, round: Room.find_by(name:"test").games.last.rounds.last, content: Faker::Quote.most_interesting_man_in_the_world)
end

# Letting the test users bet on an answer
Room.find_by(name:"test").users.each do |user|
  Bet.create!(user: user, round: Room.find_by(name:"test").games.last.rounds.last, madeup_answer: MadeupAnswer.all.random)
end

# Useful variables to defind in the console
test = User.find_by(username:"julez")
testroom = Room.find_by(name:"test")
testgame = Game.find_by(room: Room.find_by(name:"test"))

