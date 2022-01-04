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

  def show
    @group = Group.find(params[:id])
    @users = @group.users
    @user_ids = @users.pluck(:id) << current_user.id
  end

  def update
    group = Group.find(params[:id])
    user = User.find(current_user.id)
    group.users << user
    redirect_to root_path
  end

  def home
    
  end

  private
  def group_params
    params.require(:group).permit(:name, :content, user_ids: [])
  end

end
