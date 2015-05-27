class CreateProseRegions < ActiveRecord::Migration
  def change
    create_table :prose_regions do |t|
      t.string :name
      t.string :placeholder

      t.timestamps null: false
    end
  end
end
