class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :Condition
  belongs_to :shipping_price
  belongs_to :days_to_ship
  belongs_to :sender  

  validates :image,             presence: true
  validates :item_name,         presence: true
  validates :explanation,       presence: true
  validates :category_id,       presence: true
  validates :condition_id,      presence: true
  validates :shipping_price_id, presence: true
  validates :sender_id,         presence: true
  validates :days_to_ship_id,   presence: true
  validates :price,             presence: true, numericality: {only_integer: true}, inclusion: { in: 300..9999999 }
  validates :category_id,       numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id,      numericality: { other_than: 1 , message: "can't be blank"}
  validates :days_to_ship_id,   numericality: { other_than: 1 , message: "can't be blank"}
  validates :sender_id,         numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_price_id, numericality: { other_than: 1 , message: "can't be blank"}
end
