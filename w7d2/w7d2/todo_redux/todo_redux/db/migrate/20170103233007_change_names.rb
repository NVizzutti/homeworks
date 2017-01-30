class ChangeNames < ActiveRecord::Migration[5.0]
  def change
    rename_column :taggings, :todo_id, :todoId
    rename_column :taggings, :tag_id, :tagId
  end
end
