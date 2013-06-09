class CreateSaysomethings < ActiveRecord::Migration
  def change
    create_table :saysomethings do |t|
      t.string :headlines
      t.text :say
      t.string :interests
      t.integer :user_id

      t.timestamps
    end
  end
end
