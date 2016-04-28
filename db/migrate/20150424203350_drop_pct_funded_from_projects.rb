class DropPctFundedFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :pct_funded
  end
end
