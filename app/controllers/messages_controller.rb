class MessagesController < ApplicationController

  def index
    if user_signed_in?
      @groups = current_user.group
    end
    @message = Message.new
  end

  def create
  end
  
end
