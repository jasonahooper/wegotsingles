require 'spec_helper'

describe ProfilesController do

  before do
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
end
