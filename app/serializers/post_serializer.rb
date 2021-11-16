class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at, :updated_at, :user_id
  has_many :comments
end
