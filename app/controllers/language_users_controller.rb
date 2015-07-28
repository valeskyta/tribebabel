class LanguageUsersController < ApplicationController
  def index
    @languages = Language.all
    @language_user = LanguageUser.new
    @native_languages_user = current_user.languages.includes(:language_users).where(language_users: {level: 1})
    @second_languages_user = current_user.languages.includes(:language_users).where(language_users: {level: 2})

  end

  def create
    @language_user = LanguageUser.new
    @mensaje="ok!"


    if !params[:language_ids].nil?
     params[:language_ids].each do |l|
      if !current_user.has_language?(l)
        LanguageUser.create(language_id: l, user_id: current_user.id, level: 1)
      else
        @mensaje="native language already selected"
      end
    end
  end

  if !params[:second_language_ids].nil?
   params[:second_language_ids].each do |l|
    if !current_user.has_language?(l)
      LanguageUser.create(language_id: l, user_id: current_user.id, level: 2)
    else
     @mensaje="second language already selected"


   end
 end
end




redirect_to language_users_index_path, notice:  @mensaje







end
end
