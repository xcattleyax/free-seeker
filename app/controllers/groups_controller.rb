class GroupsController < ApplicationController

  def index
    @groups = current_user.group
    group_pluck = @groups.pluck(:id)
    @groups_index = Group.where.not(id: group_pluck)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, :content, user_ids: [])
  end
end
