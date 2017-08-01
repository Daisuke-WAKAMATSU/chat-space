  class MessagesController < ApplicationController

    def index
      @message = Message.new
      @groups = current_user.groups
      @group = Group.find(params[:group_id])
    end

    def create
      @message = Message.new(message_paramas)
      if @message.save
        redirect_to action: :index
      else
        render :index
      end
    end

    def update
    end

    private
    def message_paramas
      params.require(:message).permit(:body).merge(group_id: params[:group_id],user_id: current_user.id)
    end

  end
