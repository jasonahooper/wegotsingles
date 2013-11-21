require 'spec_helper'

describe ProfilesController do

  before(:each) do
    @profile = Profile.make!
    @user = User.make!
    @user.profile = @profile
  end


  describe 'Education feature' do
    before do
      @education = 1
    end

    context 'Add education on Profile' do
      before do
        @valid_params = { :profile => { :education => @education } }

        patch :update, @valid_params.merge(:id => @profile.id, :user_id => @user.id)
      end

      it "should store education" do
        @profile.reload
        @profile.education.should_not be_nil
      end

      it "should have the correct education" do
        @profile.reload
        @profile.education.should eq(@education)
      end

    end

    context 'Update education on Profile' do
      before do
        @profile.education = @education
        @profile.save!
        @valid_params = { :profile => { :education => @education2 } }

        patch :update, @valid_params.merge(:id => @profile.id, :user_id => @user.id)
      end

      it "should have the new education" do
        @profile.reload
        @profile.education.should eq(@education2)
        @profile.education.should_not eq(@education)
      end
    end
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

  describe 'Language feature' do
    before do
      @language1 = Language.make!(:language => "English")
      @language2 = Language.make!(:language => "Spanish")
    end

    context 'Add language on Profile' do
      before do
        @valid_params = {
            :profile =>
            { :language_ids => [ @language1.id, @language2.id ]
            }
          }
        patch :update, @valid_params.merge(:id => @profile.id, :user_id => @user.id)
      end
      it 'should store languages' do
        ProfileLanguage.count.should eq(2)
      end
    end

    context 'Change language on Profile' do
      before do
        @profile.languages << @language1
        @profile.save!
        @valid_params =
          { :profile =>
            { :language_ids => [ @language2.id ] }
          }
        patch :update, @valid_params.merge(:id => @profile.id, :user_id => @user.id)
      end
      it 'should remove and add a language' do
        ProfileLanguage.count.should eq(1)
        ProfileLanguage.first.language_id.should
          eq(Language.find_by_language("Spanish").id)
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

    context "For weight feature" do
      context "For weight with metric" do

        before do
          @valid_params = { :imperial_bln_weight => "false", :metric_weight => 80 }
          patch :update, :id => @user.profile.id, :user_id => @user.id, :profile => @valid_params
        end

        it "the user profile should have the height" do
          @profile.reload
          @profile.weight.should_not be_nil
        end

        it "should have the metric measurement" do
          @profile.reload
          @profile.weight.should eq(80)
        end

      end

      context "For weight with imperial" do
        before do
          @valid_params = { :imperial_bln_weight => "true", :imperial_weight => 12.59 }
          patch :update, :id => @user.profile.id, :user_id => @user.id, :profile => @valid_params
        end

        it "the user profile should have the height" do
          @profile.reload
          @profile.weight.should_not be_nil
        end

        it "should have the metric measurement" do
          @profile.reload
          @profile.weight.should eq(79)
        end
      end
    end
  end
end
