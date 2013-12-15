class AddPropertiesToStages < ActiveRecord::Migration
  def change
    add_column :stages, :properties, :hstore
  end
end
