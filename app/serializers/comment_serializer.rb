class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at, :updated_at, :post_id, :user_id
  belongs_to :user
  belongs_to :post
end
