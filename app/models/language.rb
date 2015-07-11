class Language < ActiveRecord::Base
  has_many :languageUsers
  has_many :users, through: :languageUsers
end
