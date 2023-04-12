class Address < ApplicationRecord
  validates :postal_code,  presence: true
  validates :sender_id,    presence: true
  validates :municipality, presence: true
  validates :address,      presence: true
  validates :phone_number, presence: true

  belongs_to :buying_history
end
