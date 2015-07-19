FactoryGirl.define do
  factory :component do
    name { Faker::Commerce.product_name }
    model { Faker::Lorem.word }
    stock { Faker::Number.between(0, 100) }
    description { Faker::Lorem.sentence }
    manufacturer { Faker::Company.name }
    image_link { Faker::Avatar.image }
    datasheet { Faker::Internet.url }
    category
    toolbox
  end
end
