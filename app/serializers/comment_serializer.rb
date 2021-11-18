class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at, :updated_at, :updated, :like_count
  belongs_to :user
  belongs_to :post
  has_many :likes

  def updated
    object.updated_at != object.created_at
  end

  def like_count
    object.likes.count
  end

end
