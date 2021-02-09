class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :password, format: {with: /\A(?=.*?[a-zA-Z])(?=.*?[\d])[a-zA-Z\d]+\z/}
         validates :nickname, presence: true
         validates :birthday, presence: true
         validates :real_first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/} 
         validates :real_family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/}
         validates :first_furigana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
         validates :family_furigana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}

end