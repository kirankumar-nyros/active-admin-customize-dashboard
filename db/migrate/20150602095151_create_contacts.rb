class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :Name
      t.string :Company
      t.integer :Age
      t.string :Email
      t.string :Password

      t.timestamps null: false
    end
  end
end
