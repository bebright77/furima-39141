FactoryBot.define do
  factory :order_address do

    postal_code  {"123-1234"}
    sender_id    {3}
    municipality {"千代田区"}
    address      {"テスト12"}
    building     {"アパート名"}
    phone_number {"09012341234"}
    token        {"tok_abcdefghijk00000000000000000"}
  end
end
