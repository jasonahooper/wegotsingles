require 'spec_helper'

describe Profile do
  it { should belong_to(:user) }
  it { should have_many(:profile_ethnicities) }
  it { should have_many(:ethnicities).through(:profile_ethnicities) }
  it { should have_many(:profile_languages) }
  it { should have_many(:languages).through(:profile_languages)}
end
