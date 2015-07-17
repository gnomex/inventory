FactoryGirl.define do
  factory :toolbox do
    name { Faker::App.name }
    owner { Faker::Name.name }
    description { Faker::Hacker.say_something_smart }
  end
end
