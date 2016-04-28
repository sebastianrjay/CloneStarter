class AddPctFundedToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :pct_funded, :float, default: 0
  end
end
