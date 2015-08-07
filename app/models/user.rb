class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:twitter, :facebook]

  validates :gender, presence:true
  validates :country_id, presence:true

  has_many :languageUsers
  has_many :languages, through: :languageUsers


  has_many :posts, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  enum role: [:guest, :moderator]

  before_save :default_values

    def default_values
    self.role ||=0
  end

  def has_language? language_id
    self.languages.where(id: language_id).any?
  end


  def self.find_for_oauth(auth, signed_in_resource = nil)
    identity = Identity.find_for_oauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user

    if user.nil?
      email = auth.info.email
      user = User.find_by(email: email) if email

      # Create the user if it's a new registration
      if user.nil?
        password = Devise.friendly_token[0,20]
        if auth.provider == 'facebook'
          user = User.new(
            email: email ? email : "#{auth.uid}@change-me.com",
            password: password,
            password_confirmation: password
          )
        elsif auth.provider == 'twitter'
          user = User.new(
            email: "#{auth.uid}@change-me.com",
            password: password,
            password_confirmation: password
          )
        end
      end
      user.save!
    end

    if identity.user != user
      identity.user = user
      identity.save!
    end

    user
  end

  def email_verified?
    if self.email
      if self.email.split('@')[1] == 'change-me.com'
        return false
      else
        return true
      end
    else
      return false
    end
  end
end






