class UsersController < ApplicationController
  def edit
    @user = current_user.name
    @user = User.new
    @user.save
  end


end


