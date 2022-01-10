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

end
