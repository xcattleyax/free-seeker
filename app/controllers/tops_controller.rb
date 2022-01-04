class TopsController < ApplicationController
  def index
    @groups = current_user.group if user_signed_in?
  end
end
