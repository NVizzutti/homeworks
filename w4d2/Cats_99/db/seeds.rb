

99.times do
  name = Faker::Name.name
  sex = Cat::SEXES.sample
  birth_date = Faker::Time.between(10.years.ago, DateTime.now)
  description = Faker::Company.catch_phrase
  color = Cat::COLORS.sample

  Cat.create(name: name, sex: sex, birth_date: birth_date, description: description, color: color)
end
