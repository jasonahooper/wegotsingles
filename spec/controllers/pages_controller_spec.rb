require 'spec_helper'

describe PagesController do
  context "GET to homepage" do
    before do
      get :home
    end

    it "should work" do
      expect(response).to be_success
    end
  end
end
