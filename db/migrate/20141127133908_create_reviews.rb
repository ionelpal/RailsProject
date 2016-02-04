class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :productname
      t.text :reviwtext
      t.integer :itemrate

      t.timestamps
    end
  end
end
