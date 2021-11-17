class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|

      t.timestamps
    end

    add_reference :likes, :post, null: false, foreign_key: true
    add_reference :likes, :user, null: false, foreign_key: true
  end
end
