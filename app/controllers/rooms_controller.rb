class RoomsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @room = Room.new(room_params)
    if @room.save
      redirect_to controller: :chats, action: :index
    else
      render root_path
    end
  end
  def show
    redirect_to controller: :chat, action: :index
  end
  def destroy
    item = Item.find(params[:item_id])
    room = Room.find(params[:id])
    if item.room.id == room.id
     room.destroy
     redirect_to root_path
    else
     render :show
    end
  end
  private
  def room_params
    params.require(:room).permit(user_ids:[]).merge(item_id: params[:item_id])
  end
end
