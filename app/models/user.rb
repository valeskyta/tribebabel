class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :gender, presence:true
  validates :country_id, presence:true

  has_many :languageUsers
  has_many :languages, through: :languageUsers


  has_many :posts, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  def has_language? language_id
    self.languages.where(id: language_id).any?
  end
end


