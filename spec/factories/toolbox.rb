FactoryGirl.define do
  factory :toolbox do
    name { Faker::App.name }
    location {[Faker::Name.prefix, Faker::Name.last_name, "cabinet"].join(' ')}
    owner { Faker::Name.name }
    description { Faker::Hacker.say_something_smart }
  end
end
