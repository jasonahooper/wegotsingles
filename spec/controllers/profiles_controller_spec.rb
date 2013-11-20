require 'spec_helper'

describe ProfilesController do

  before(:each) do
    @user = User.make!
    @profile = @user.profile
  end

  describe 'Ethnicity feature' do
    before do
      @ethnicity1 = Ethnicity.make!(:ethnicity => "White")
      @ethnicity2 = Ethnicity.make!(:ethnicity => "Spanish")
    end

    context 'Add ethnicity on Profile' do
      before do
        @valid_params = {
          :profile =>
          { :ethnicity_ids => [ @ethnicity1.id, @ethnicity2.id ]
          }
        }
        patch :update, @valid_params.merge(:id => @profile.id, :user_id => @user.id)
      end
      it 'should store ethnicities' do
        ProfileEthnicity.count.should eq(2)
      end
    end

    context 'Change ethnicity on Profile' do
      before do
        @profile.ethnicities << @ethnicity1
        @profile.save!
        @valid_params =
        { :profile =>
          { :ethnicity_ids => [ @ethnicity2.id ] }
        }
        patch :update, @valid_params.merge(:id => @profile.id, :user_id => @user.id)
      end
      it 'should remove and add an ethnicity' do
        ProfileEthnicity.count.should eq(1)
        ProfileEthnicity.first.ethnicity_id.should
        eq(Ethnicity.find_by_ethnicity("Spanish").id)
      end
    end
  end

  describe 'Language feature' do
    before do
      @language1 = Language.make!(:language => "English")
      @language2 = Language.make!(:language => "Spanish")
    end

    context 'Add language on Profile' do
      before do
        @valid_params = {
            :profile =>
            { :language_ids => [ @language1.id, @language2.id ]
            }
          }
        patch :update, @valid_params.merge(:id => @profile.id, :user_id => @user.id)
      end
      it 'should store languages' do
        ProfileLanguage.count.should eq(2)
      end
    end

    context 'Change language on Profile' do
      before do
        @profile.languages << @language1
        @profile.save!
        @valid_params =
          { :profile =>
            { :language_ids => [ @language2.id ] }
          }
        patch :update, @valid_params.merge(:id => @profile.id, :user_id => @user.id)
      end
      it 'should remove and add a language' do
        ProfileLanguage.count.should eq(1)
        ProfileLanguage.first.language_id.should
          eq(Language.find_by_language("Spanish").id)
      end
    end
  end

  context "GET to show" do
    before do
      get :show, :id => @user.profile.id, :user_id => @user.id
    end

    it "should work" do
      expect(response).to be_success
    end
  end

  context "Patch to update" do
    context "For height with metric" do

      before do
        @valid_params = { :imperial => "false", :metric_height => 190 }
        patch :update, :id => @user.profile.id, :user_id => @user.id, :profile => @valid_params
      end

      it "the user profile should have the height" do
        @profile.reload
        @profile.height.should_not be_nil
      end

      it "should have the metric measurement" do
        @profile.reload
        @profile.height.should eq(190)
      end
    end

    context "For height with imperial" do

      before do
        @valid_params = { :imperial => "true", :imperial_height => 6.2 }
        patch :update, :id => @user.profile.id, :user_id => @user.id, :profile => @valid_params
      end

      it "the user profile should have the height" do
        @profile.reload
        @profile.height.should_not be_nil
      end

      it "should have the metric measurement" do
        @profile.reload
        @profile.height.should eq(188)
      end
    end
  end

  describe 'Image upload feature' do

    context 'Upload the first image' do
      before do
        @test_file = 'gary.jpg'
        file = fixture_file_upload("/" + @test_file,'application/jpg')
        @valid_params = { :images_attributes => [ :image => file ] }
        patch :update, :id => @user.profile.id, :user_id => @user.id,
          :profile => @valid_params
      end
      it 'should save the image to a directory' do
        new_path = "public/uploads/image/image/#{assigns(:profile).images.last.id}"
        new_file = "#{new_path}/#{@test_file}"
        File::exists?(new_file).should eq(true)
      end
      it 'should save the thumbnail to a directory' do
        new_path = "public/uploads/image/image/#{assigns(:profile).images.last.id}"
        new_file = "#{new_path}/thumb_#{@test_file}"
        File::exists?(new_file).should eq(true)
      end
      it 'should have one profile image' do
        assigns(:profile).images.count.should eq(1)
      end
    end

    context 'Upload an additional image' do
      before do
        @profile.images << Image.make!(:image => "first.jpg")
        @test_file = 'gary.jpg'
        file = fixture_file_upload("/" + @test_file,'application/jpg')
        @valid_params = { :images_attributes => [ :image => file ] }
        patch :update, :id => @user.profile.id, :user_id => @user.id,
          :profile => @valid_params
      end
      it 'should save the image to a directory' do
        new_path = "public/uploads/image/image/#{assigns(:profile).images.last.id}"
        new_file = "#{new_path}/#{@test_file}"
        File::exists?(new_file).should eq(true)
      end
      it 'should save the thumbnail to a directory' do
        new_path = "public/uploads/image/image/#{assigns(:profile).images.last.id}"
        new_file = "#{new_path}/thumb_#{@test_file}"
        File::exists?(new_file).should eq(true)
      end
      it 'should have two profile images' do
        assigns(:profile).images.count.should eq(2)
      end
    end

    context 'Remove the only image' do
      before do
        @profile.images << Image.make!(:image => "first.jpg")
        image_id = @profile.images.first.id
        @valid_params = { :images_attributes => [ :id => image_id, :_destroy => true ] }
        patch :update, :id => @user.profile.id, :user_id => @user.id,
          :profile => @valid_params
      end
      it 'should have no profile images' do
        assigns(:profile).images.count.should eq(0)
      end
    end

    context 'Remove one of two images' do
      before do
        @profile.images << Image.make!(:image => "first.jpg")
        @profile.images << Image.make!(:image => "second.jpg")
        image_id = @profile.images.first.id
        @valid_params = { :images_attributes => [ :id => image_id, :_destroy => true ] }
        patch :update, :id => @user.profile.id, :user_id => @user.id,
          :profile => @valid_params
      end
      it 'should have one profile images' do
        assigns(:profile).images.count.should eq(1)
      end
    end

    context 'Upload an image and remove an image' do
      before do
        @profile.images << Image.make!(:image => "first.jpg")
        image_id = @profile.images.first.id
        @test_file = 'gary.jpg'
        file = fixture_file_upload("/" + @test_file,'application/jpg')
        @valid_params = { :images_attributes => [ { :image => file }, { :id => image_id, :_destroy => true } ] }
        patch :update, :id => @user.profile.id, :user_id => @user.id,
          :profile => @valid_params
      end
      it 'should save the image to a directory' do
        new_path = "public/uploads/image/image/#{assigns(:profile).images.last.id}"
        new_file = "#{new_path}/#{@test_file}"
        File::exists?(new_file).should eq(true)
      end
      it 'should save the thumbnail to a directory' do
        new_path = "public/uploads/image/image/#{assigns(:profile).images.last.id}"
        new_file = "#{new_path}/thumb_#{@test_file}"
        File::exists?(new_file).should eq(true)
      end
      it 'should have one profile image' do
        assigns(:profile).images.count.should eq(1)
      end
    end
  end
end
