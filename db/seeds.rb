5.times do |i|
  puts "[#{i}]Creating a category"
  Category.create!({
    name: Faker::Commerce.department
  })
end

2.times do |i|
  puts "[#{i}]Creating a box"
  Toolbox.create!({
    name: Faker::App.name,
    location:[Faker::Name.prefix, Faker::Name.last_name, "cabinet"].join(' '),
    owner: Faker::Name.name,
    description: Faker::Hacker.say_something_smart
  })
end

10.times do |i|
  puts "[#{i}]Creating a component"
  Component.create!({
    name: Faker::Commerce.product_name,
    model: Faker::Lorem.word,
    stock: Faker::Number.between(0, 100),
    description: Faker::Lorem.sentence,
    manufacturer: Faker::Company.name,
    image_link: Faker::Avatar.image,
    datasheet: Faker::Internet.url,
    status: {in_use: "noop"},
    category: Category.take,
    toolbox: Toolbox.take
  })
end


