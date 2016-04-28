class FixProjectImgUrLs < ActiveRecord::Migration
  def change
    remove_columns :projects, :main_pic_url, :other_pic_url
    add_column :projects, :main_image_url, :string, null: false
    add_column :projects, :secondary_image_url, :string
  end
end
