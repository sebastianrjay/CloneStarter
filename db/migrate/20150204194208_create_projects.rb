class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :starter_id, null: false
      t.string :title, null: false
      t.float :fund_goal, null: false
      t.text :description, null: false
      t.date :end_date, null: false
      t.text :summary, null: false
      t.string :city, null: false

      # Add category_id, main_img and video_link later

      t.timestamps null: false
    end
  end
end
