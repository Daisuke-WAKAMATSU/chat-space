class MessagesController < ApplicationController
  before_action :set_group, only: [:index, :create]

  def index
    @message = Message.new
    @groups = current_user.groups
  end

  def create
    @message = @group.messages.new(message_paramas)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path, notice: "メッセージが送信されました。" }
        format.json
      end
    else
      redirect_to group_messages_path, alert: "メッセージ送信が失敗しました。"
    end
  end

  private
  def message_paramas
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
