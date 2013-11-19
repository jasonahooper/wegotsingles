require 'spec_helper'

describe Language do
  it { should have_many(:profile_languages) }
  it { should have_many(:profiles).through(:profile_languages)}
end
