class CreateProsePageRegionAssets < ActiveRecord::Migration
  def change
    create_table :prose_page_region_assets do |t|
      t.integer :page_id
      t.integer :region_id
      t.integer :asset_id
      t.integer :position

      t.timestamps null: false
    end

    add_index :prose_page_region_assets, :page_id
    add_index :prose_page_region_assets, :region_id
    add_index :prose_page_region_assets, :asset_id
    
  end
end
