require 'spec_helper'

describe ProfilesController do
  context 'Create ethnicity on Profile' do
    before do
      @profile = Profile.new
      ethnicity1 = Ethnicity.make!(:ethnicity => "White")
      ethnicity2 = Ethnicity.make!(:ethnicity => "African")
      @valid_params =
        { :profile =>
          { :profile_ethnicities_attributes => [
            { :ethnicity => ethnicity1 },
            { :ethnicity => ethnicity2 }
            ]
          }
        }
    end
    it 'should store an ethnicity' do
      post :create, @valid_params
    end
  end
end
