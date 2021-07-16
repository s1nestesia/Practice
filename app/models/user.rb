class User < ApplicationRecord
  has_many :followers,foreign_key: "followed_id", class_name: "Relationship"
  has_many :following,foreign_key: "follower_id", class_name: "Relationship"
  acts_as_voter
  has_many :posts, dependent: :destroy
  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
