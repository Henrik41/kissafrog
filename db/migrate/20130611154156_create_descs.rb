class CreateDescs < ActiveRecord::Migration
  def change
    create_table :descs do |t|
      t.string :height
      t.string :bodytype
      t.string :eye
      t.string :hair
      t.string :ethnicity
      t.string :religion
      t.string :education
      t.string :profession
      t.string :marital
      t.integer :longestrelation
      t.string :kids
      t.string :wantkids
      t.string :pets
      t.string :smoke
      t.string :drink
      t.string :drug
      t.string :language
      t.string :exercise
      t.string :food
      t.string :travel
      t.string :car
      t.string :books
      t.string :dateasmoker
      t.string :mindpets
      t.string :relationshipsearched
      t.string :educationsearched
      t.string :typeofguy
      t.string :sexsearched

      t.timestamps
    end
  end
end
