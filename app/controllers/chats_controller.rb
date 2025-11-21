class ChatsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_chat, only: [:show, :destroy]
  before_action :authorize_destroy, only: [:destroy]

  def index
    @chats = current_user.chats
    @items = current_user.items
    @chat_item = ChatItem.new
  end

  def show
    @message = Message.new
  end

  def destroy
    if @chat.destroy
      flash[:notice] = "The chat was successfully deleted"
      redirect_to chats_path, status: :see_other
    else
      flash[:alert] = "The chat was not deleted!"
      redirect_to chat_path(@chat), status: :unprocessable_entity
    end
  end

  private

  def find_chat
    @chat = Chat.find(params[:id])
  end

  def authorize_destroy
    unless @chat.user == current_user
      flash[:alert] = "Vous n'êtes pas autorisé à effectuer cette action"
      redirect_to root_path
      return
    end
  end
end
