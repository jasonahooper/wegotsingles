require 'spec_helper'

describe Image do
  it { should belong_to(:profile) }

  include CarrierWave::Test::Matchers

  describe 'Image resizing' do
    before do
      ImageUploader.enable_processing = true
      @image = Image.make!(:with_file)
    end

    it "should create a thumbnail of exactly 80 by 80 pixels" do
      @image.image.thumb.should have_dimensions(80, 80)
    end

    it "should create an image of exactly 400 by 400 pixels" do
      @image.image.should have_dimensions(400, 400)
    end

    it "should scale down an image to fit within 400 by 400 pixels" do
      @image.image.gallery.should be_no_larger_than(400, 400)
    end

    after do
      ImageUploader.enable_processing = false
    end
  end
end

