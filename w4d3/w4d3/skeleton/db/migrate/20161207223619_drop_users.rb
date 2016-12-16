class DropUsers < ActiveRecord::Migration
  def change
    change_column :users, :session_token, :string, null: true
    add_column(:users, :created_at, :datetime)
    add_column(:users, :updated_at, :datetime)
  end
end
