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
    @groups = current_user.group
    @users = @group.users
    @user_ids = @users.pluck(:id) << current_user.id
  end

  def addition
    group = Group.find(params[:id])
    user = User.find(current_user.id)
    group.users << user
    redirect_to root_path
  end

  def home
    @group = Group.find(params[:id])
    @users = @group.users
    @groups = current_user.group
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    group = Group.find(params[:id])
    group.update(group_params)
    redirect_to home_group_path(group.id)
  end

  private
  def group_params
    params.require(:group).permit(:name, :content, user_ids: [])
  end

end
