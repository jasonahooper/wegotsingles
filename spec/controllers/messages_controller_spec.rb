require 'spec_helper'

describe MessagesController do
  before do
    @john = User.make!
    @sally = User.make!(:different_user)
    @message_from_john = Message.make!(:from_man)
    @message_from_sally = Message.make!(:from_woman)
    @message_from_john.to_id = @john.id
    @message_from_john.from_id = @sally.id
  end

  it "sends a message from timmy to sally" do
    @message_from_john.to
  end


end
