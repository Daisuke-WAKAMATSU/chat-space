class GroupsController < ApplicationController
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
    group = Group.find(params[:id])
    group.update(group_paramas)
    redirect_to root_path, notice:"グループが編集されました。"
  end

  private
  def group_paramas
    params.require(:group).permit(:name, user_ids: [])
  end
end
