Factory.define do
  factory :post_item do
    name { Faker::Lorem.characers(number:5) }
    introduction { Faker::Lorem.characters(number:20) }
  end
end