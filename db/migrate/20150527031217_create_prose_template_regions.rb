class CreateProseTemplateRegions < ActiveRecord::Migration
  def change
    create_table :prose_template_regions do |t|
      t.integer :template_id
      t.integer :region_id

      t.timestamps null: false
    end

    add_index :prose_template_regions, :template_id
    add_index :prose_template_regions, :region_id
  end
end
