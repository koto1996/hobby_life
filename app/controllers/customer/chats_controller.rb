class Customer::ChatsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @group = Group.find(params[:group_id])
    @customers = @group.customers
    @chat = Chat.new
    @chat.group = @group
    @chats = @group.chats
  end

  def create
    @chat = current_customer.chats.new(chat_params)
    if @chat.save
      redirect_to action:'index',notice: 'メッセージ送信しました'
    else
      redirect_to action:'index',notice: 'メッセージの送信に失敗しました'
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:message,:group_id,:customer_id)
  end
end
