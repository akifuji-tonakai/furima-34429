class ExPricesController < ApplicationController
  before_action :before_create, only: :create
  before_action :get_away, only: [:update]
  def create
    @ex_price = ExPrice.new(ex_price_params)
    if @ex_price.save
      redirect_to controller: :chats, action: :index
    else
      render 'chats/index'
    end
  end
  def update
    if @item.price.to_i > @item.ex_price.etcprice.to_i
    @item.update(price: @item.ex_price.etcprice)
    end
    @item.ex_price.destroy
    redirect_to controller: :chats, action: :index
  end
  def destroy
    etcprice = ExPrice.find(params[:id])
    etcprice.destroy
    redirect_to controller: :chats, action: :index
  end

  private
  def ex_price_params
    params.require(:ex_price).permit(:etcprice).merge(item_id: params[:item_id], room_id: @item.room.id)
  end
  def before_create
    @item = Item.find(params[:item_id])
    @chat = Chat.new
    @room = @item.room
    room_id = @room.id
    @chats = Chat.where(room_id: room_id).includes(:user)
  end
  def get_away
    @item = Item.find(params[:item_id])
    if user_signed_in? && @item.user.id == current_user.id
    else
      redirect_to root_path
    end
  end
end
