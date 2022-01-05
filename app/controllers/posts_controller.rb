class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_user_params)
    if @post.save
      redirect_to new_post_page_path(@post.id)
    else
      render "new"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_user_params)
    redirect_to new_post_page_path(post.id)
  end

  private
  def post_user_params
    params.require(:post).permit(:title).merge(contributor: current_user, status_id: 1)
  end
end
