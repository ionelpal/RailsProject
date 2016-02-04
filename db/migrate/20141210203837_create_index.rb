class CreateIndex < ActiveRecord::Migration
  

  def change
    create_table :indices do |t|
      t.string :item
      t.string :review
    end
  end

  
end
