class User < ApplicationRecord

  has_many :likes , dependent: :destroy
  has_many :posts, dependent: :destroy

  has_many :followers, foreign_key: "followed_id", class_name: "Relationship"
  has_many :following, foreign_key: "follower_id", class_name: "Relationship"

  has_many :autolike_follower_follows, foreign_key: :autolike_following_id, class_name: "Autolike"
  has_many :autolike_followers, through: :autolike_follower_follows, source: :autolike_follower

  has_many :autolike_following_follows, foreign_key: :autolike_follower_id, class_name: "Autolike"
  has_many :autolike_followings, through: :autolike_following_follows, source: :autolike_following

  acts_as_voter

  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
