require 'spec_helper'

describe ProfileLanguage do
  it { should belong_to(:profile) }
  it { should belong_to(:language) }
end
