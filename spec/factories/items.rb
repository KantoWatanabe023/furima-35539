FactoryBot.define do
  factory :item do
    items_name {Faker::Lorem.sentence}
    items_about {Faker::Lorem.sentence}
    category_id {5}
    status_id {2}
    shipping_id {3}
    place_id {4}
    day_id {3}
    price {300}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
