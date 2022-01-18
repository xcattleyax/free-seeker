class CommentsController < ApplicationController

  def index
    posts = Post.where(contributor: current_user, status_id: 2)
    groups = current_user.groups
    posts_g = Post.where(contributor: groups, status_id: 2)
    @posts = posts + posts_g
    posts_array = @posts.pluck(:id)
    @comments = Comment.where(post_id: posts_array).limit(5)
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    session[:previous_url] = request.referer
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to session[:previous_url]
    else
      render "new"
    end
  end

  def show
    @comment = Comment.find(params[:id])
    @post = Post.find(@comment.post_id)
    @answer = Answer.new
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(status_id: 1, post_id: params[:post_id], user_id: current_user.id)
  end
end
