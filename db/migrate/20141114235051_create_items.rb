class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.string :image_ur
      t.string :img_url_big
      t.string :category

      t.timestamps
    end
  end
end
