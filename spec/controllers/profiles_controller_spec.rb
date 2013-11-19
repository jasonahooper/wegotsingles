require 'spec_helper'

describe ProfilesController do

  before(:each) do
    @profile = Profile.make!
    @user = User.make!
    @user.profile = @profile
  end

  context "GET to show" do

    before do
      get :show, :id => @user.profile.id, :user_id => @user.id
    end

    it "should work" do
      expect(response).to be_success
    end

  end

  context "GET to create for height" do

    before do
      @user.profile.height = 190
      @user.save!
    end

    it "the user profile should have the height" do
      @user.profile.height.should_not be_nil
    end

    it "the user profile height should be displayed in both metrics" do

    end
  end
end
