class UsersController < ApplicationController
  def add_name
    @user = current_user
    @user.name = params[:user_name]
    @user.save

    redirect_to new_post_path
  end


end


