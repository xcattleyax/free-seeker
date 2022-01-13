class TopsController < ApplicationController
  def index
    @groups = current_user.groups if user_signed_in?
  end

  def new
    group = Group.first
    user = User.find(current_user.id)
    group.users << user
    redirect_to root_path
  end
end
