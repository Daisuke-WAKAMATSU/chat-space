class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]

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
  end

  def update
    if @group.update(group_paramas)
      redirect_to root_path, notice:"グループが編集されました。"
    else
      flash.now[:alert] = "グループ編集が失敗しました。"
      render :edit
    end
  end

  private
  def group_paramas
    params.require(:group).permit(:name, user_ids: [])
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
