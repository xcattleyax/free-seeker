class PostsController < ApplicationController
  def index
    contributor = if params[:group_id].nil?
                    User.find(current_user.id)
                  else
                    Group.find(params[:group_id])
                  end
    @posts = contributor.posts.where(status_id: 1)
  end

  def new
    @post = Post.new
    @contributor = if params[:group_id].nil?
                     'user'
                   else
                     params[:group_id]
                   end
  end

  def create
    @contributor = params[:post][:contributor]
    @contributor_value = if @contributor == 'user'
                           current_user
                         else
                           Group.find(@contributor)
                         end
    @post = Post.new(post_params)
    if @post.save
      redirect_to new_post_page_path(@post.id)
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
    @pages = @post.pages
  end

  def update
    post = Post.find(params[:id])
    @contributor_value = post.contributor
    post.update(post_params)
    redirect_to new_post_page_path(post.id)
  end

  def release
    post = Post.find(params[:id])
    pages = post.pages
    post.update(status_id: 2)
    redirect_to root_path
  end

  def list
    @posts = Post.where(status_id: 2).order('created_at DESC').limit(50)
  end

  def search
    posts = Post.where(status_id: 2).order('created_at DESC').limit(50)
    if params[:contributor] != '' && params[:title] != ''
      user = User.find_by(name: params[:contributor])
      group = Group.find_by(name: params[:contributor])
      @posts = posts.where('title LIKE(?)',
                           "%#{params[:title]}%").where(contributor: user).or(posts.where('title LIKE(?)',
                                                                                          "%#{params[:title]}%").where(contributor: group))
    elsif params[:contributor] != '' && params[:title] == ''
      user = User.find_by(name: params[:contributor])
      group = Group.find_by(name: params[:contributor])
      @posts = posts.where(contributor: user).or(posts.where(contributor: group))
    elsif params[:title] != ''
      @posts = posts.where('title LIKE(?)', "%#{params[:title]}%")
    else
      @posts = posts
    end
  end

  def show
    post = Post.find(params[:id])
    page = post.pages.find_by(page: 1)
    redirect_to post_page_path(post_id: params[:id], id: page.id)
  end

  def my
    @groups = current_user.groups if user_signed_in?
    @posts = current_user.posts.where(status_id: 2)
  end

  private

  def post_params
    params.require(:post).permit(:title).merge(contributor: @contributor_value, status_id: 1)
  end
end
