class TopsController < ApplicationController

  def index
    if user_signed_in?
      @groups = current_user.group
    end
  end

end
