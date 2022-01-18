class AnswersController < ApplicationController

  def index
    @answers = Answer.where(post_id: params[:post_id])
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to comments_path
    else
      @post = Post.find(params[:post_id])
      @comment = Comment.find(params[:answer][:comment_id])
      render "comments/show"
    end
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:question, :answer).merge(post_id: params[:post_id])
  end
end