class Autolike < ApplicationRecord
  belongs_to :autolike_follower, class_name: "User", foreign_key: "autolike_follower_id"
  belongs_to :autolike_following, class_name: "User", foreign_key: "autolike_following_id"
end