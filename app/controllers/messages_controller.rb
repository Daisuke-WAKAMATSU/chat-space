class MessagesController < ApplicationController

  def index
    @message = Message.new  
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
  end

  def create
    @message = current_user.messages.new(message_paramas)
    if @message.save
      redirect_to group_messages_path, notice:"メッセージを送信しました。"
    else
      flash.now[:alert] = "メッセージを入力してください。"
    end
  end

  def update
  end

  private
  def message_paramas
    params.require(:message).permit(:body).merge(group_id: params[:group_id])
  end

end
