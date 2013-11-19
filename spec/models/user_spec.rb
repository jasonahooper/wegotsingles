require 'spec_helper'

describe User do
  context "associations" do
    it { should have_one(:profile) }
  end

  context "creates a profile" do
    before do
      @user = User.make!
    end

    it "automatically creates a profile on creation" do
      assert(@user.profile)
    end
  end
end
