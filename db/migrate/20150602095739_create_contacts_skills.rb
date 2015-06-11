class CreateContactsSkills < ActiveRecord::Migration
  def change
    create_table :contacts_skills do |t|
      t.integer :contact_id
      t.integer :skill_id
    end
  end
end
