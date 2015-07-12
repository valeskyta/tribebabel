class LanguageUsersController < ApplicationController
  def index
    @languages = Language.all
    @language_user = LanguageUser.new
    @native_languages_user = current_user.languages.includes(:language_users).where(language_users: {level: 1})
    @second_languages_user = current_user.languages.includes(:language_users).where(language_users: {level: 2})
   
  end

  def create
    @language_user = LanguageUser.new

    params[:language_ids].each do |l|
      if !current_user.has_language?(l)
          LanguageUser.create(language_id: l, user_id: current_user.id, level: 1)
          
      end
    end

    params[:second_language_ids].each do |l|
      if !current_user.has_language?(l)
          LanguageUser.create(language_id: l, user_id: current_user.id, level: 2)
         
      end
    end


    

  end
end
