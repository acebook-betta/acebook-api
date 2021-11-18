class AddCommentToLikes < ActiveRecord::Migration[6.1]
  def change
    change_column_null :likes, :post_id, true
    add_reference :likes, :comment, null: true, foreign_key: true
  end
end
