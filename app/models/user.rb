class User < ApplicationRecord
  include Clearance::User
  has_many :users_posts
  has_many :posts, through: :users_posts
end
