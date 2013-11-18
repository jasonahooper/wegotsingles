require 'spec_helper'

describe ProfileEthnicity do
  it { should belong_to(:profile) }
  it { should belong_to(:ethnicity) }
end
