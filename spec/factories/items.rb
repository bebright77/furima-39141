FactoryBot.define do
  factory :item do
  association :user

    item_name         { "本" }
    explanation       { "中古の本です" }
    category_id       { 3 }
    condition_id      { 2 }
    shipping_price_id { 2 }
    sender_id         { 2 }
    days_to_ship_id   { 2 }
    price             { 300 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
