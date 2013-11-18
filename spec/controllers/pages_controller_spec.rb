require 'spec_helper'

describe PagesController do
  context "GET to show" do
    before do
      get :show, :id => '1'
    end

    it "should work" do
      expect(response).to be_success
    end
  end
end
