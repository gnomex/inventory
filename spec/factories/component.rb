FactoryGirl.define do
  factory :component do
    part_number "abcd123"
    stock 10
    description "Something mocked"
    manufacturer "gnomex"
    image_link "someplace.io/image.png"
    datasheet "www.alldatasheets.com/search?q=abcd1234"
    # category
  end
end
