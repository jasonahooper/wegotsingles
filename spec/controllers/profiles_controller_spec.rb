require 'spec_helper'

describe ProfilesController do

  context "GET to show" do
    before do
      @profile = Profile.make!
      @user = User.make!
      @user.profile = @profile
      get :show, :id => @user.profile.id, :user_id => @user.id
    end

    it "should work" do
      expect(response).to be_success
    end
  end

end
