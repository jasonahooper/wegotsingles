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

  context "GET to create for height with metric" do

    before do
      @user.profile.height = 190
      @user.save!
    end

    it "the user profile should have the height" do
      @user.profile.height.should_not be_nil
    end

    it "should have the metric measurement" do
      @user.profile.height.should eq(190)
    end

  end

  context "GET to create for height with imperial" do

    before do
      @user.profile.imperial = true
      @user.profile.height = 6.2
      @user.save!
    end

    it "the user profile should have the height" do
      @user.profile.height.should_not be_nil
    end

    it "should have the metric measurement" do
      @user.profile.height.should eq(188)
    end

  end
end
