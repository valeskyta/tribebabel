class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :languageUsers
  has_many :languages, through: :languageUsers

  def has_language? language_id
    self.languages.where(id: language_id).any?
  end
end
