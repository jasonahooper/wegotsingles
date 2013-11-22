class MessagesController < ApplicationController

  def index
    @user = User.find(current_user.id)
  end

  def create
    @message = Message.new(message_params)
    @message.from = current_user
    @message.save!
    render :nothing => true
  end

  private
  def message_params
    params.require(:message).permit(:subject, :body, :from_id, :to_id)
  end
end
