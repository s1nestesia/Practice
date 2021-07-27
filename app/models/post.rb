class Post < ApplicationRecord

  has_many :likes
  validates :image,content_type: ['image/png', 'image/jpg', 'image/jpeg']

  has_many :comments
  acts_as_votable
  belongs_to :user
  has_one_attached :image
  validate :image_presence
  def image_presence
  errors.add(:image, "can't be blank") unless image.attached?
  end
end