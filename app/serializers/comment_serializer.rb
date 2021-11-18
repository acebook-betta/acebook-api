class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at, :updated_at, :updated
  belongs_to :user
  belongs_to :post

  def updated
    object.updated_at != object.created_at
  end

end
