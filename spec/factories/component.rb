FactoryGirl.define do
  factory :component do
    name "Incredible Steel Table"
    model "accusamus"
    stock 99
    description "Doloribus repellendus ea quod cupiditate optio et."
    manufacturer "Crist Inc"
    image_link "http://robohash.org/inquisenim.png?size=300x300"
    datasheet "http://rosenbaumschaefer.org/jaylan.sawayn"
    category
    toolbox
  end
end
# factory :component do
# name { Faker::Commerce.product_name }
# model { Faker::Lorem.word }
# stock { Faker::Number.between(0, 100) }
# description { Faker::Lorem.sentence }
# manufacturer { Faker::Company.name }
# image_link { Faker::Avatar.image }
# datasheet { Faker::Internet.url }
# category
# toolbox
# end
