class MessagesController < ApplicationController

  def index
    @user = current_user
  end

  def new
    @message = Message.new
    @user = current_user
  end

  def show
    @message = Message.find(params[:id])
    @reply = Message.new(:reply_id => @message)
  end

  def create
    @message = Message.new(message_params)
    @message.from = current_user
    @message.save!
    flash[:notice] = "Your message has been sent"
    redirect_to messages_path
  end

  private
  def message_params
    params.require(:message).permit(:subject, :body, :from_id, :to_id)
  end
end
