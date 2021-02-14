class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_item_params, only: [:index,:create]
  before_action :get_away, only: :index

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      pay_credit
      @order_address.saved
      redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def get_item_params
    @item = Item.find(params[:item_id])
  end

  def order_address_params
    params.require(:order_address).permit(:post_number, :send_from_id, :village_name, :village_number,:building_detail, :tele_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_credit
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_address_params[:token],
        currency: 'jpy'
      )
  end
  def get_away
    if user_signed_in? && @item.user.id != current_user.id && @item.order.blank?
      # 可読性を高めるためにif文で記述 フィルター通過後のここは無処理
    else
      redirect_to root_path
    end
  end

end