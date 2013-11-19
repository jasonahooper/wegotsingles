require 'spec_helper'

describe Profile do
  it { should belong_to(:user) }
  it { should have_many(:profile_ethnicities) }
  it { should have_many(:ethnicities).through(:profile_ethnicities) }
end
