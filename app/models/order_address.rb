class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :post_number, :send_from_id, :village_name, :village_number, :building_detail, :tele_number

  with_options presence: true do
    validates :token
    validates :post_number, format: {with: /\A\d{3}-\d{4}\z/, message: "Should input correctly including '-' "}, length:{ maximum: 8}
    validates :tele_number, numericality: { only_integer: true, message: "only Number" }, length: {maximum: 11}
    validates :village_name
    validates :village_number
  end
  validates :send_from_id, numericality: { other_than: 1, message:"Should be selected" }

  def saved
    order = Order.create(user_id: user_id, item_id: item_id, token: token)
    Address.create(post_number: post_number, send_from_id: send_from_id, village_name: village_name, village_number: village_number, building_detail: building_detail, tele_number: tele_number, order_id: order.id)
  end

end