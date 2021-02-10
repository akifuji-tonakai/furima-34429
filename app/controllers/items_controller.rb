class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end



  private
  def item_params
    params.require(:item).permit(:name, :introduction, :category_id, :status_id, :shipping_fee_id, :send_from_id, :shipping_days_id, :price).merge(user_id: current_user.id)
  end
end
