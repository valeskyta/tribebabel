class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :twitter]

  validates :gender, presence:true
  validates :country_id, presence:true

  has_many :languageUsers
  has_many :languages, through: :languageUsers

  belongs_to :country


  has_many :posts, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :identities, dependent: :destroy

  enum role: [:guest, :moderator]

  before_save :default_values

  mount_uploader :picture, PictureUploader

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
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      user = User.where(email:email).first if email

      if user.nil?
        binding.pry
        if identity.provider == "twitter"
          user = User.new(
            name: auth.info.name,
            email: email ? email : "update@me.com",
            gender: auth.extra.raw_info.gender,
            password: Devise.friendly_token[0,20]
          )
        else
          user = User.new(
            name: auth.info.name,
            email: email ? email : "update@me.com",
            gender: auth.extra.raw_info.gender,
            password: Devise.friendly_token[0,20]
          )
        end
        user.save!
      end
    end

    unless identity.user == user
      identity.user = user
      identity.save!
    end
    user
  end
end






