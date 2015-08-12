class UsersController < ApplicationController
  def add_name
    @user = current_user
    @user.name = params[:user_name]
    @user.save!
    p @user.to_json

    redirect_to new_post_path
  end

# esto muestra todos los usuarios, se crea la ruta y la vista get 'users/show_users'
  def show_users
    @users = User.all
  end

  def finish_signup
    if request.patch? && params[:user] # Revisa si el request es de tipo patch, es decir, llenaron el formulario y lo ingresaron
      @user = User.find(params[:id])

      if @user.update(user_params)
        sign_in(@user, :bypass => true)
        redirect_to root_path, notice: 'Your email has been saved.'
      else
        @show_errors = true
      end
    end
  end

  private
    def user_params
      accessible = [ :name, :email, :picture, :picture_cache ] # extend with your own params
      accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
      params.require(:user).permit(accessible)
    end
end






