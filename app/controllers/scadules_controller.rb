class ScadulesController < ApplicationController

  def index
    if params[:group_id] == nil
      @group = Group.find(1)
    else
      @group = Group.find(params[:group_id])
    end
    user = current_user
    @groups = user.groups
    @scadules = @group.scadules
  end

  def new
    @scadule = Scadule.new
    @groups = current_user.groups
  end

  def create
    @scadule = Scadule.new(scadule_params)
    if @scadule.save
      redirect_to scadules_path
    else
      @groups = current_user.groups
      render "new"
    end
  end

  def show
    @scadule = Scadule.find(params[:id])
  end

  private
  def scadule_params
    params.require(:scadule).permit(:date, :content, :text, :group_id)
  end
end
