class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.includes(:user).order(created_at: "DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def show
    @item = Item.find(params[:id])
  end



  private
  def item_params
    params.require(:item).permit(:name, :item_image, :introduction, :category_id, :status_id, :shipping_fee_id, :send_from_id, :shipping_days_id, :price).merge(user_id: current_user.id)
  end
end
