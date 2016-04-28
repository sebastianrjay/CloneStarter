class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.integer :pledger_id, null: false
      t.integer :project_id, null: false
      t.float :amt, null: false

      # Add reward_choice_id in later migration

      t.timestamps null: false
    end
  end
end
