FactoryBot.define do
  factory :order_residence do
    post_num { '123-4567' }
    place_id { 2 }
    city { '東京都' }
    address { '1-1' }
    building { '東京ハイツ' }
    phone_num {'12345678912'}
  end
end
