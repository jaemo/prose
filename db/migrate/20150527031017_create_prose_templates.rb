class CreateProseTemplates < ActiveRecord::Migration
  def change
    create_table :prose_templates do |t|
      t.string :name
      t.string :file_name

      t.timestamps null: false
    end
  end
end
