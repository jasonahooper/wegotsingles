require 'spec_helper'

describe Profile do
  it { should belong_to(:user) }
  it { should have_many(:profile_ethnicities) }
  it { should have_many(:ethnicities).through(:profile_ethnicities) }
  it { should have_many(:profile_languages) }
  it { should have_many(:languages).through(:profile_languages)}

  describe "height conversion" do
    context "with imperial measurments" do
      before do
       @profile = Profile.new(:imperial => "true", :imperial_height => 6.2)
       @profile.save!
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
        @profile = Profile.make!(:metric_height => 188)
      end

      it "the user profile should have the height" do
        @profile.height.should_not be_nil
      end

      it "should convert the imperial to metric" do
        @profile.height.should eq(188)
      end
    end

  end

  describe "Weight conversion" do
    context "Weight with imperial measurments" do
      before do
       @profile = Profile.new(:imperial_bln_weight => "true", :imperial_weight => 12.59)
       @profile.save!
      end

      it "the user profile should have the weight" do
        @profile.weight.should_not be_nil
      end

      it "should convert the imperial to metric" do
        @profile.weight.should eq(79)
      end
    end

    context "Weight with metric measurments" do
      before do
        @profile = Profile.new(:imperial_bln_weight => "false", :metric_weight => 80)
        @profile.save!
      end

      it "the user profile should have the weight" do
        @profile.weight.should_not be_nil
      end

      it "should convert the imperial to metric" do
        @profile.weight.should eq(80)
      end
    end

  end

end
