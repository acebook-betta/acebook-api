class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :content, :image_url, :created_at, :updated_at, :updated, :like_count, :comment_count
  belongs_to :user
  has_many :comments
  has_many :likes

  def updated
    object.updated_at != object.created_at
  end

  def image_url
    return rails_blob_path(object.image, only_path: true) if object.image.attached?
  end

  def like_count
    object.likes.count
  end

  def comment_count
    object.comments.count
  end
end
