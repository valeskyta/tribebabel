class Users::RegistrationsController < Devise::RegistrationsController
before_filter :configure_sign_up_params
# before_filter :configure_account_update_params, only: [:update]

  # def country
  # end

  # GET /resource/sign_up
  # def new
  #   super
  # end



  def update
    super
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # You can put the params you want to permit in the empty array.
     def configure_sign_up_params
      #devise_parameter_sanitizer.for(:sign_up) << :email, :password, :password_confirmation
       devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :gender, :country_id, :name, :picture, :picture_cache, :bio, :passion, :travels, :nickname ) }

       devise_parameter_sanitizer.for(:account_update) << :bio
       devise_parameter_sanitizer.for(:account_update) << :picture_cache
       devise_parameter_sanitizer.for(:account_update) << :name
       devise_parameter_sanitizer.for(:account_update) << :passion
       devise_parameter_sanitizer.for(:account_update) << :travels
       devise_parameter_sanitizer.for(:account_update) << :picture
       devise_parameter_sanitizer.for(:account_update) << :nickname
       devise_parameter_sanitizer.for(:account_update) << :coverpicture

     end

  # You can put the params you want to permit in the empty array.
  def configure_account_update_params
    devise_parameter_sanitizer.for(:account_update) << :bio
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end


