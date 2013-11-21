require 'spec_helper'

describe Profile do
  it { should belong_to(:user) }
  it { should have_many(:profile_ethnicities) }
  it { should have_many(:ethnicities).through(:profile_ethnicities) }
  it { should have_many(:profile_languages) }
  it { should have_many(:languages).through(:profile_languages)}

  describe "profile progress" do
    before do
      @profile = Profile.make!(:without_height)
      @number_of_attributes = Profile.progress_attributes.count
      @percentage = 80 / @number_of_attributes 
      @profile.occupation = "Coder"
      @profile.save!
    end

    context "with one attribute" do

      it "should show some progress" do
        @profile.progress.should eq(@percentage)
      end
    end

    context "update profile should return new progress" do
      before do
        @profile.education = "University"
        @profile.save!
      end

      it "should show that the progress has incremented" do
        @profile.progress.should eq(@percentage*2)
      end
    end

    context "removing an attribute" do
      before do
        @profile.education = "University"
        @profile.save!
        @profile.occupation = ""
        @profile.education = nil
        @profile.save!
      end

      it "should deincrement the progress meter" do
        @profile.progress.should eq(0)
      end
    end
  end

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
        @profile = Profile.make(:without_height)
        @profile.metric_height = 188
        @profile.save!
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
        @profile = Profile.make(:without_weight)
        @profile.metric_weight = 80
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
