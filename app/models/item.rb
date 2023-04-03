class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :item_name,         presence: true
  validates :explanation,       presence: true
  validates :category_id,       presence: true
  validates :condition_id,      presence: true
  validates :shipping_price_id, presence: true
  validates :sender_id,         presence: true
  validates :days_to_ship_id,   presence: true
  validates :price,             presence: true
  validates :image,             presence: true
end
