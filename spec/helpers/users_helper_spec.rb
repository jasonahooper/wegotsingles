require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the PagesHelper. For example:
#
# describe PagesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe UsersHelper do

  context "Earliest start year" do
    before do
      @year = helper.earliest_year_to_join
    end

    it "should return the earliest year to sign up" do
      @year.should eq(1995)
    end
  end

end
