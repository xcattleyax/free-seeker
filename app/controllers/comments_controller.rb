class CommentsController < ApplicationController

  def index
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    session[:previous_url] = request.referer
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to session[:previous_url]
    else
      render "index"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(post_id: params[:post_id])
  end
end
