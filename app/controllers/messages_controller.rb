class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @groups = current_user.group
    @message = Message.new
    @messages = Message.where(group_id: params[:group_id]).order('created_at DESC').limit(50)
  end

  def create
    @message = Message.new(message_params)
    @group = Group.find(params[:group_id])
    MessageChannel.broadcast_to @group, { message: @message, user: @message.user, group: @message.group } if @message.save
  end

  private

  def message_params
    params.require(:message).permit(:message).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end
