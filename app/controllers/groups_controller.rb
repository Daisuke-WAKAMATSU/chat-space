class GroupsController < ApplicationController
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

  def update
  end

  private
  def group_paramas
    params.require(:group).permit(:name, user_ids: [])
  end
end
