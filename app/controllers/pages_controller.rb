class PagesController < ApplicationController
  def new
    @page = Page.new
    @post = Post.find(params[:post_id])
    @pages = @post.pages
    @page_length = @pages.length + 1
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to new_post_page_path(params[:post_id])
    else
      render 'new'
    end
  end

  def edit
    @page = Page.find(params[:id])
    @post = Post.find(params[:post_id])
    @pages = @post.pages
    @page_length = @page.page
  end

  def update
    page = Page.find(params[:id])
    page.update(page_params)
    redirect_to new_post_page_path(params[:post_id])
  end

  def show
    @post = Post.find(params[:post_id])
    @page = Page.find(params[:id])
    @pages = @post.pages
    @pre_page = Page.find_by(page: @page.page - 1) unless @page.page == 1
    @next_page = Page.find_by(page: @page.page + 1) unless @page.page == @pages.length
  end

  private

  def page_params
    params.require(:page).permit(:content, :text, :page).merge(post_id: params[:post_id])
  end
end
