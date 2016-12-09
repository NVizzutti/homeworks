
10.times do
  name = Faker::Name.name
  pass = "password"
  a = User.new
  a.user_name = name
  a.password = pass
  a.save
end

99.times do
  name = Faker::Name.name
  sex = Cat::SEXES.sample
  birth_date = Faker::Time.between(10.years.ago, DateTime.now)
  description = Faker::Company.catch_phrase
  color = Cat::COLORS.sample
  user_id = (1..10).to_a.sample
  Cat.create(user_id: user_id, name: name, sex: sex, birth_date: birth_date, description: description, color: color)
end

10.times do
  cat_id = (1..100).to_a.sample
  end_date = Faker::Time.forward(23, :morning)
  start_date = Faker::Time.backward(14, :evening)
  CatRentalRequest.create(cat_id: cat_id, start_date: start_date, end_date: end_date)
end
