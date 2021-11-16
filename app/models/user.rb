class User < ApplicationRecord
  has_many :posts
  validates_uniqueness_of :email
end
