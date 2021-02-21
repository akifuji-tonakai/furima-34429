class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         has_many :items
         has_many :orders
         has_many :room_users
         has_many :rooms, through: :room_users
         has_many :chats

         validates :password, format: {with: /\A(?=.*?[a-zA-Z])(?=.*?[\d])[a-zA-Z\d]+\z/, message: "Include both letters and numbers"}
         with_options presence: true do
          validates :nickname
          validates :birthday
          with_options format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: "Full-width characters"} do
           validates :real_first_name
           validates :real_family_name
          end
          with_options format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"} do
            validates :first_furigana
            validates :family_furigana
          end
        end
end