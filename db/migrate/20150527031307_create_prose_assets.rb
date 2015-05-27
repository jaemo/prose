class CreateProseAssets < ActiveRecord::Migration
  def change
    create_table :prose_assets do |t|
      t.string :name
      t.text :content

      t.timestamps null: false
    end
  end
end
