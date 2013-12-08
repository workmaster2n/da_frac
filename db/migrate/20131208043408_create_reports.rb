class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :well_name
      t.hstore :attributes

      t.timestamps
    end
  end
end
