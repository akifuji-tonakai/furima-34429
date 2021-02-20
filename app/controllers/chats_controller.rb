class ChatsController < ApplicationController
  before_action :get_params_item_and_room_and_chats, only: [:index,:create]
  before_action :get_away, only: [:index,:create]

  def index
    @chat = Chat.new
  end

  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      redirect_to action: :index
    else
      render :index
    end
  end

  private
  def chat_params
    params.require(:chat).permit(:content, :item_id).merge(user_id: current_user.id, room_id: @room.id)
  end
  def get_params_item_and_room_and_chats
    @item = Item.find(params[:item_id])
    @room = @item.room
    room_id = @room.id
    @chats = Chat.where(room_id: room_id).includes(:user)
    @ex_price = ExPrice.new
  end
  def get_away
    if user_signed_in? && @room.users.ids.include?(current_user.id)
    else
      redirect_to root_path
    end
  end
end
