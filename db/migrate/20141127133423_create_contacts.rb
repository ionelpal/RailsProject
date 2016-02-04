class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :firstname
      t.string :lastname
      t.string :emaill
      t.string :phone
      t.text :message

      t.timestamps
    end
  end
end
