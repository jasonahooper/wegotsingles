require 'spec_helper'

describe ProfilesController do
  context 'Create ethnicity on Profile' do
    before do
      @profile = Profile.new
      ethnicity1 = Ethnicity.make!(:ethnicity => "White")
      ethnicity2 = Ethnicity.make!(:ethnicity => "African")
      @valid_params = {
          :profile =>
          { :profile_ethnicities_attributes => [
            { :ethnicity_id => ethnicity1.id },
            { :ethnicity_if => ethnicity2.id }
            ]
          }
        }
      post :create, @valid_params
    end
    it 'should store an ethnicity' do
      assert Profile.count.should eq(1)
      assert ProfileEthnicity.count.should eq(2)
    end
  end

  context 'Change ethnicity on Profile' do
    before do
      @profile = Profile.make!
      ethnicity1 = Ethnicity.make!(:ethnicity => "White")
      ethnicity2 = Ethnicity.make!(:ethnicity => "Spanish")
      @profile.ethnicities << ethnicity1
      @profile.save!
      p = @profile.profile_ethnicities.first
      @valid_params =
        { :profile =>
          { :profile_ethnicities_attributes => [
            { :ethnicity_id => ethnicity2.id },
            { :id => p.id, :_destroy => '1' }
            ]
          }
        }
      patch :update, @valid_params.merge(:id => @profile.id)
    end
    it 'should store an ethnicity' do
      assert ProfileEthnicity.count.should eq(1)
    end
  end
end
