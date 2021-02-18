class ChatsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @chat = Chat.new
    @ex_price = ExPrice.new
    @room = @item.room
    room_id = @room.id
    @chats = Chat.where(room_id: room_id).includes(:user)
  end

  def create
    @item = Item.find(params[:item_id])
    @room = @item.room
    @chat = Chat.new(chat_params)
    if @chat.save!
      redirect_to action: :index
    else
      render :index
    end
  end

  private
  def chat_params
    params.require(:chat).permit(:content, :item_id).merge(user_id: current_user.id, room_id: @room.id)
  end
end
