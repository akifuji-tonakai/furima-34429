class ExPrice < ApplicationRecord
  belongs_to :item
  belongs_to :room

  validates :etcprice, presence: true, numericality: { less_than_or_equal_to: 10000000, greater_than_or_equal_to: 300 }
end
