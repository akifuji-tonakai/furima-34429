class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :get_record, only: [:show, :edit, :update, :destroy]
  before_action :get_away, only: [:edit, :destroy]

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

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end
  
  def show
    @room = Room.new
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :item_image, :introduction, :category_id, :status_id, :shipping_fee_id, :send_from_id, :shipping_days_id, :price).merge(user_id: current_user.id)
  end
  
  def get_record
    @item = Item.find(params[:id])
  end

  def get_away
    if current_user == @item.user && @item.order.blank?
    else 
      redirect_to root_path
    end
  end
end
