class AddPledgeTotalToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :pledge_total, :float, default: 0.00
  end
end
