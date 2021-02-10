class Item < ApplicationRecord
  belongs_to :user, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :category, dependent: :destroy
  has_one :status, dependent: :destroy
  has_one :shipping_fee, dependent: :destroy
  has_one :send_from,  dependent: :destroy
  has_one :shipping_days, dependent: :destroy

  with_options presence: true do
    validates :name, length:{ maximum: 40 }
    validates :introduction, length: { maximum: 1000 }
    validates :price, numericality: { only_integer: true }
    with_options numericality: { other_than: 1, message: "Should be selected" } do
      validates :category_id
      validates :status_id
      validates :shipping_fee_id
      validates :send_from_id
      validates :shipping_days_id
    end
  end
end