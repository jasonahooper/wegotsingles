require 'spec_helper'

describe ProfileEthnicity do
  it { should belong_to(:profile) }
  it { should validate_presence_of(:ethnicity) }
end
