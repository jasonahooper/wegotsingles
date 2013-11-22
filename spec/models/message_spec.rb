require 'spec_helper'

describe Message do
  it { should belong_to(:to) }
  it { should belong_to(:from) }


  describe "Sending a message" do
    before do
      @timmy = Man.make!
      @sally = Woman.make!(:email => "sally@mail.com")
    end

    context "from a Man with a premium account to a Woman" do
      before do
        @message = Message.make!(:to => @sally, :from => @timmy)
      end

      it "should be in sallys received messages" do
        @sally.reload.received_messages.should include(@message)
      end

      it "should be in timmys send messages" do
        @timmy.reload.sent_messages.should include(@message)
      end
    end
  end
end
