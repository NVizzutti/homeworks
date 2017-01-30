class ChangeNamesAgain < ActiveRecord::Migration[5.0]
  def change
    rename_column :steps, :todoId, :todo_id
    rename_column :taggings, :tagId, :tag_id
    rename_column :taggings, :todoId, :todo_id
  end
end
