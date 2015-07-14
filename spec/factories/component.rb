FactoryGirl.define do
  factory :component do
    part_number "abcd123"
    stock 10
    description "Something mocked"
    datasheet "www.alldatasheets.com/search?q=abcd1234"
  end
end
