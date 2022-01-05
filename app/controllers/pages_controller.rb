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
      render "new"
    end
  end

  private
  def page_params
    params.require(:page).permit(:content, :text, :page).merge(post_id: params[:post_id])
  end
end
