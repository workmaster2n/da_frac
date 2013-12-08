class ChangeReportStructure < ActiveRecord::Migration
  def change
    remove_column :reports, :well_name
    remove_column :reports, :properties
    add_column :reports, :well_id, :integer
  end
end
