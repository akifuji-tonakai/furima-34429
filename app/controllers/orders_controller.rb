class OrdersController < ApplicationController
  before_action :get_item_params, only: [:index,:create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    binding.pry
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      pay_credit
      @order_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def get_item_params
    @item = Item.find(params[:item_id])
  end

  def order_address_params
    params.require(:order_address).permit(:item_id, :post_number, :send_from_id, :village_name, :village_number,:building_detail, :tele_number).merge(token: params[:token], user_id: current_user.id)
  end

  def pay_credit
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_address_params[:token],
        currency: 'jpy'
      )
  end
end