class CreateXtras < ActiveRecord::Migration
  def change
    create_table :xtras do |t|
      t.integer :user_id
      t.integer :picid

      t.timestamps
    end
  end
end
