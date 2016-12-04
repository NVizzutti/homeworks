class CreateAnswerChoises < ActiveRecord::Migration
  def change
    create_table :answer_choices do |t|
      t.text :text, null: false
      t.integer :question_id, null: false, index: true
    end
  end
end
