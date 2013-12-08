class CreateStages < ActiveRecord::Migration
  def change
    create_table :stages do |t|
      t.integer :well_id
      t.date :frac_date
      t.integer :gpi
      t.integer :gpi2
      t.integer :top_perf
      t.integer :bottom_perf
      t.integer :stage_length
      t.integer :shots

      t.timestamps
    end
  end
end
