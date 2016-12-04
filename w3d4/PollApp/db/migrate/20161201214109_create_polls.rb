class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :title, null: false, index: true
      t.integer :author_id, null: false, index: true
    end
  end
end
