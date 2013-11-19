require 'spec_helper'

describe Ethnicity do
  it { should have_many(:profile_ethnicities) }
  it { should have_many(:profiles).through(:profile_ethnicities) }
end
