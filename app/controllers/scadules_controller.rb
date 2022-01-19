class ScadulesController < ApplicationController

  def index
    groups = current_user.groups.pluck(:id)
    @scadules = Scadule.where(group_id: groups)
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

  def edit
    @scadule = Scadule.find(params[:id])
    @groups = current_user.groups
  end

  def update
    scadule = Scadule.find(params[:id])
    scadule.update(scadule_params)
    redirect_to scadule_path(scadule.id)
  end

  def destroy
    scadule = Scadule.find(params[:id])
    scadule.destroy
    redirect_to scadules_path
  end

  private
  def scadule_params
    params.require(:scadule).permit(:date, :content, :text, :group_id)
  end
end