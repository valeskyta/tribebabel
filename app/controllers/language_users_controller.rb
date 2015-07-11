class LanguageUsersController < ApplicationController
  def index
    @languages = Language.all
    @language_user = LanguageUser.new
    @languages_user = current_user.languages
  end

  def create
    @language_user = LanguageUser.new

    params[:language_ids].each do |l|
      if !current_user.has_language?(l)
          LanguageUser.create(language_id: l, user_id: current_user.id, level: 1)
          @language_user.save
      end
    end
  end
end
