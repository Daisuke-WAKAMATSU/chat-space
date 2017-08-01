class GroupsController < ApplicationController
  before_action :move_to_signin

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_paramas)
    if @group.save
      redirect_to root_path, notice:"グループを作成しました。"
    else
      flash.now[:alert] = "グループ作成が失敗しました。"
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
  end

  private
  def group_paramas
    params.require(:group).permit(:name, user_ids: [])
  end

  def move_to_signin
    redirect_to "new_user_session" unless user_signed_in?
  end
end
