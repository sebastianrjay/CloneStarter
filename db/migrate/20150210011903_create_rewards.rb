class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.integer :project_id, null: false
      t.text :summary, null: false
      t.date :est_delivery, null: false
      t.float :min_amt, null: false

      t.timestamps null: false
    end
  end
end
