require 'spec_helper'

describe ProfilesController do
  context 'Create ethnicity on Profile' do
    before do
      @profile = Profile.new
      ethnicity1 = "White"
      ethnicity2 = "African"
      @valid_params = { :profile =>
        { :ethnicity => [ethnicity1, ethnicity2 ] }
      }
    end
    it 'should store an ethnicity' do
      post :create, @valid_params
    end
  end
end
