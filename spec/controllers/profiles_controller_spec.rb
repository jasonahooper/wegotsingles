require 'spec_helper'

describe ProfilesController do

  before(:each) do
    @profile = Profile.make!
    @user = User.make!
    @user.profile = @profile
  end

  describe 'Ethnicity feature' do
    before do
      @ethnicity1 = Ethnicity.make!(:ethnicity => "White")
      @ethnicity2 = Ethnicity.make!(:ethnicity => "Spanish")
    end

    context 'Add ethnicity on Profile' do
      before do
        @valid_params = {
          :profile =>
          { :ethnicity_ids => [ @ethnicity1.id, @ethnicity2.id ]
          }
        }
        patch :update, @valid_params.merge(:id => @profile.id, :user_id => @user.id)
      end
      it 'should store ethnicities' do
        ProfileEthnicity.count.should eq(2)
      end
    end

    context 'Change ethnicity on Profile' do
      before do
        @profile.ethnicities << @ethnicity1
        @profile.save!
        @valid_params =
        { :profile =>
          { :ethnicity_ids => [ @ethnicity2.id ] }
        }
        patch :update, @valid_params.merge(:id => @profile.id, :user_id => @user.id)
      end
      it 'should remove and add an ethnicity' do
        ProfileEthnicity.count.should eq(1)
        ProfileEthnicity.first.ethnicity_id.should
        eq(Ethnicity.find_by_ethnicity("Spanish").id)
      end
    end
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
        @valid_params = { :imperial => "false", :metric_height => 190 }
        patch :update, :id => @user.profile.id, :user_id => @user.id, :profile => @valid_params
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
        @valid_params = { :imperial => "true", :imperial_height => 6.2 }
        patch :update, :id => @user.profile.id, :user_id => @user.id, :profile => @valid_params
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
