class CreateProsePages < ActiveRecord::Migration
  def change
    create_table :prose_pages do |t|
      t.string :title
      t.integer :template_id
      t.string :menu_title
      t.string :body_class
      t.string :hide_title
      t.string :meta_description
      t.string :meta_keywords
      t.boolean :visible
      t.boolean :active
      t.string :slug
      t.string :meta_title
      t.integer :lft
      t.integer :rgt
      t.integer :depth
      t.integer :parent_id

      t.timestamps null: false
    end

    add_index :prose_pages, :active
    add_index :prose_pages, :visible
    add_index :prose_pages, :title
    add_index :prose_pages, :parent_id
    add_index :prose_pages, :template_id
    add_index :prose_pages, :slug
  end
end
