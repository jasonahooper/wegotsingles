require 'spec_helper'

describe UsersController do
  before do
    Man.create(:password => "password", 
      :email => "John.Smith@gmail.com")
  end


  it "creates a man" do
    expect(Man.all.count).to eq(1)
  end



end
