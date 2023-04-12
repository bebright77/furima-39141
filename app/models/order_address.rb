class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :sender_id, :municipality, :address, :building, :phone_number, :price, :user_id, :item_id, :token
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :sender_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :municipality
    validates :address
    validates :phone_number, format: {with: /\A\d{10,11}\z/ }
    validates :token
  end

  def save
    buying_history = BuyingHistory.create(user_id: user_id, item_id: item_id)
    Address.create(buying_history_id: buying_history.id, postal_code: postal_code, municipality: municipality, address: address, building: building, phone_number: phone_number)
  end
end