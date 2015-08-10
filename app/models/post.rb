class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  belongs_to :user

  validates :content, presence: true

  mount_uploader :picture, PictureUploader
end



