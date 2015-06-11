class CreateGroupsSkills < ActiveRecord::Migration
  def change
    create_table :groups_skills do |t|
      t.integer :group_id
      t.integer :skill_id
    end
  end
end
