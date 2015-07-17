FactoryGirl.define do
  factory :component do
    name "Banana PI"
    model "MMB1"
    stock 10
    description "Something mocked"
    manufacturer "gnomex"
    image_link "someplace.io/image.png"
    datasheet "www.alldatasheets.com/search?q=abcd1234"
    category
  end
end
