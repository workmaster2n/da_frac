class AddNumberToStages < ActiveRecord::Migration
  def change
    add_column :stages, :number, :integer
  end
end
