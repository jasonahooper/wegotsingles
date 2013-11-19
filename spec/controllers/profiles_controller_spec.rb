require 'spec_helper'

describe ProfilesController do
  before do
    @profile = Profile.make!
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
      patch :update, @valid_params.merge(:id => @profile.id)
    end
    it 'should store ethnicities' do
      Profile.count.should eq(1)
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
      patch :update, @valid_params.merge(:id => @profile.id)
    end
    it 'should remove and add an ethnicity' do
      ProfileEthnicity.count.should eq(1)
      ProfileEthnicity.first.ethnicity_id.should
        eq(Ethnicity.find_by_ethnicity("Spanish").id)
    end
  end
end
