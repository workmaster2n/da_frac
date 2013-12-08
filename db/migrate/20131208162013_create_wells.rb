class CreateWells < ActiveRecord::Migration
  def change
    create_table :wells do |t|
      t.string :name
      t.date :start_date

      t.timestamps
    end
  end
end
