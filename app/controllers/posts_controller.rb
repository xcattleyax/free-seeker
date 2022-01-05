class PostsController < ApplicationController

  def new
    @post = Post.new
    @contributor =  if params[:group_id] == nil
                      "user"
                    else
                      params[:group_id]
                    end
  end

  def create
    @contributor = params[:post][:contributor]
    @contributor_value =  if @contributor == "user"
                            current_user
                          else
                            Group.find(@contributor)
                          end
    @post = Post.new(post_params)
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
    @contributor_value = post.contributor
    post.update(post_params)
    redirect_to new_post_page_path(post.id)
  end

  private
  def post_params
    params.require(:post).permit(:title).merge(contributor: @contributor_value, status_id: 1)
  end
end
