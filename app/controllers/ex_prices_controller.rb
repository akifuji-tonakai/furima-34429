class ExPricesController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @ex_price = ExPrice.new(ex_price_params)
    if @ex_price.save
      redirect_to controller: :chats, action: :index
    else
      render 'chats/index'
    end
  end
  def update
    @item = Item.find(params[:item_id])
    @item.update(price: @item.ex_price.etcprice)
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
end
