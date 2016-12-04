class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :user_id, null: false, index: true
      t.integer :answer_choice_id, null: false, index: true
    end
  end
end
