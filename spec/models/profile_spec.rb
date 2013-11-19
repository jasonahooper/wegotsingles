require 'spec_helper'

describe Profile do
  it { should belong_to(:user) }

  describe "height conversion" do
    context "with imperial measurments" do
      before do
       @profile = Profile.new({:imperial => true, :height => 6.2})
      end

      it "the user profile should have the height" do
        @profile.height.should_not be_nil
      end

      it "should convert the imperial to metric" do
        @profile.height.should eq(188)
      end
    end

    context "with metric measurments" do
      before do
        @profile = Profile.make!(:height => 188)
      end

      it "the user profile should have the height" do
        @profile.height.should_not be_nil
      end

      it "should convert the imperial to metric" do
        @profile.height.should eq(188)
      end
    end


  end
end
