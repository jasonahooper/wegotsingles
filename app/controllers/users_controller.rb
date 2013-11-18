class UsersController < ApplicationController

  def create
    @user = User.factory(params)
    if @user.save!
      redirect_to user_path(@user)
    end
  end

end
