# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Creating users...'
users = []
10.times do
  users << User.create(user_name: Faker::Internet.user_name)
end

puts 'Creating polls...'

polls = []
10.times do
  polls << Poll.create(
                  author_id: users.sample.id,
                  title: Faker::University.name)
end

puts 'Creating questions...'

questions = []

polls.each do |poll|
  5.times do
    questions << Question.create(
                      poll_id: poll.id,
                      text: Faker::Hipster.sentence(9))
  end
end

puts 'Creating answers...'

answers = []
questions.each do |question|
  3.times do
    answers << AnswerChoice.create(
                      question_id: question.id,
                      text: Faker::Hipster.sentence(2))
  end
end

puts 'Creating responses...'

responses = []

50.times do
  Response.create(user_id: users.sample.id, answer_choice_id: answers.sample.id)
end
