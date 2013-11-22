require 'spec_helper'

describe MessagesController do
  context "logged in user" do
    before do
      @john = User.make!
      sign_in @john
      @sally = User.make!(:different_user)
    end

    context "sending a message" do
      before do
        @valid_params = { :message => { :subject => "Hello. I have monkeys",
          :body => "Lets go to the zoo",
          :to_id => @sally }
        }
        post :create, @valid_params
      end

      it "should increase the message count" do
        Message.count.should eq(1)
      end

      it "should have the correct information" do
        Message.first.subject.should include(@valid_params[:message][:subject])
        Message.first.body.should include(@valid_params[:message][:body])
      end

      it "sally should have her own message" do
        @sally.reload.received_messages.count.should eq(1)
        @sally.reload.received_messages.first.subject.should include(@valid_params[:message][:subject])
      end

      it "john should have his own sent message" do
        @john.reload.sent_messages.count.should eq(1)
        @john.reload.sent_messages.first.subject.should include(@valid_params[:message][:subject])
      end
    end
  end
end
