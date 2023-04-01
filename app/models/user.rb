class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
validates :nickname, presence: true
validates :password, presence:true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
validates :last_name_kanji, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください'}
validates :first_name_kanji, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください'} 
validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶ一一]+\z/, message: '全角(カタカナ)を使用してください'}
validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶ一一]+\z/, message: '全角(カタカナ)を使用してください'}
validates :birth, presence: true

has_many :items
has_many :buying_histories

end
