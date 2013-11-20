require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ProfilesHelper. For example:
#
# describe ProfilesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe ProfilesHelper do
  it "should assocaite 2 with interested" do
    helper.level_of_interest(2).should eq("interested")
  end
  it "should assocaite 3 with very interested" do
    helper.level_of_interest(3).should eq("very interested")
  end
end
