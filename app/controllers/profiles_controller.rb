class ProfilesController < ApplicationController
  # ruta get 'profiles/show/:id', to: 'profiles#show'
  def show

    if params.key?(:nickname)
      @user = User.find_by(nickname: params[:nickname])
    else
      @user = current_user
    end
    if current_user
      @native_languages_user = current_user.languages.includes(:language_users).where(language_users: {level: 1})
      @second_languages_user = current_user.languages.includes(:language_users).where(language_users: {level: 2})
    end
  end

  def edit
  end

  def add_name
    @user = current_user
    @user.name = params[:user_name]
    @user.save


  end





end
