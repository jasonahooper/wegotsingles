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

  context "Patch to update" do
    context "For height with metric" do

      before do
        @valid_params = { :imperial => false, :height => 190 }
        patch :update, :id => @user.profile.id, :user_id => @user.id, :profiles => @valid_params
      end

      it "the user profile should have the height" do
        @profile.reload
        @profile.height.should_not be_nil
      end

      it "should have the metric measurement" do
        @profile.reload
        @profile.height.should eq(190)
      end
    end

    context "For height with imperial" do

      before do
        @valid_params = { :imperial => true, :height => 6.2 }
        patch :update, :id => @user.profile.id, :user_id => @user.id, :profiles => @valid_params
      end

      it "the user profile should have the height" do
        @profile.reload
        @profile.height.should_not be_nil
      end

      it "should have the metric measurement" do
        @profile.reload
        @profile.height.should eq(188)
      end
    end
  end


end
