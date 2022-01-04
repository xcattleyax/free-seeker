class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_user_params)
    if @post.save
      redirect_to root_path
    else
      render "new"
    end
  end

  private
  def post_user_params
    params.require(:post).permit(:title).merge(contributor: current_user, status_id: 1)
  end
end
