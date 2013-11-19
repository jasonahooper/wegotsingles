require 'spec_helper'

describe ProfilesController do
  context 'Create ethnicity on Profile' do
    before do
      @profile = Profile.new
      ethnicity1 = Ethnicity.make!(:ethnicity => "White")
      ethnicity2 = Ethnicity.make!(:ethnicity => "African")
      @valid_params = {
          :profile =>
          { :ethnicity_ids => [ ethnicity1.id, ethnicity2.id ]
          }
        }
      post :create, @valid_params
    end
    it 'should store an ethnicity' do
      Profile.count.should eq(1)
      ProfileEthnicity.count.should eq(2)
    end
  end

  context 'Change ethnicity on Profile' do
    before do
      @profile = Profile.make!
      ethnicity1 = Ethnicity.make!(:ethnicity => "White")
      ethnicity2 = Ethnicity.make!(:ethnicity => "Spanish")
      @profile.ethnicities << ethnicity1
      @profile.save!
      @valid_params =
        { :profile =>
          { :ethnicity_ids => [ ethnicity2.id ] }
        }
      patch :update, @valid_params.merge(:id => @profile.id)
    end
    it 'should store an ethnicity' do
      ProfileEthnicity.count.should eq(1)
      ProfileEthnicity.first.ethnicity_id.should
        eq(Ethnicity.find_by_ethnicity("Spanish").id)
      binding.pry
    end
  end
end
