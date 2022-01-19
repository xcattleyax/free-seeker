class TopsController < ApplicationController
  def index
    @groups = current_user.groups if user_signed_in?
    @posts = Post.where(status_id: 2).order(updated_at: :desc).limit(5)
  end

  def new
    unless Group.first == nil
      group = Group.first
      user = User.find(current_user.id)
      group.users << user
      redirect_to root_path
    end
  end
end
