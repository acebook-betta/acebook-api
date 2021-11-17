class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name
  has_many :posts
  has_many :comments
  has_many :likes
end
