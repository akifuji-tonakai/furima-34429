class User < ApplicationRecord
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
          validates :password, format: {with: /\A(?=.*?[a-zA-Z])(?=.*?[\d])[a-zA-Z\d]+\z/, message: "Include both letters and numbers"}
          validates :nickname
          validates :birthday
          validates :real_first_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "Full-width characters"} 
          validates :real_family_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "Full-width characters"}
          validates :first_furigana, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
          validates :family_furigana, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
         end

end