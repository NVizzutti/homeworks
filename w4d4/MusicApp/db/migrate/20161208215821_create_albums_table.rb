class CreateAlbumsTable < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name, null: false
    end
    create_table :albums do |t|
      t.string :title, null: false
      t.string :band_id, null: false
      t.string :recorded
    end

    create_table :tracks do |t|
      t.string :song, null: false
      t.string :album_id, null: false
    end
  end
end
