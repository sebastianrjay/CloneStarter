class AddNotNullToMainImgUrl < ActiveRecord::Migration
  def change
    change_column :projects, :main_pic_url, :string, null: false
  end
end
