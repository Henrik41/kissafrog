class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :user_id
      t.text :description
      t.boolean :setting

      t.timestamps
    end
  end
end
