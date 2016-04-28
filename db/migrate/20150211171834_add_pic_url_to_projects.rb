class AddPicUrlToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :main_pic_url, :string
    add_column :projects, :other_pic_url, :string
  end
end
