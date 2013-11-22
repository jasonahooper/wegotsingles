class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def show
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.from = current_user
    @message.save!
    redirect_to messages_path
  end

  private
  def message_params
    params.require(:message).permit(:subject, :body, :from_id, :to_id)
  end
end
