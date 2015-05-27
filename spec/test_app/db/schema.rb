# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150527031542) do

  create_table "prose_assets", force: :cascade do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prose_page_region_assets", force: :cascade do |t|
    t.integer  "page_id"
    t.integer  "region_id"
    t.integer  "asset_id"
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "prose_page_region_assets", ["asset_id"], name: "index_prose_page_region_assets_on_asset_id"
  add_index "prose_page_region_assets", ["page_id"], name: "index_prose_page_region_assets_on_page_id"
  add_index "prose_page_region_assets", ["region_id"], name: "index_prose_page_region_assets_on_region_id"

  create_table "prose_pages", force: :cascade do |t|
    t.string   "title"
    t.integer  "template_id"
    t.string   "menu_title"
    t.string   "body_class"
    t.string   "hide_title"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.boolean  "visible"
    t.boolean  "active"
    t.string   "slug"
    t.string   "meta_title"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.integer  "parent_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "prose_pages", ["active"], name: "index_prose_pages_on_active"
  add_index "prose_pages", ["parent_id"], name: "index_prose_pages_on_parent_id"
  add_index "prose_pages", ["slug"], name: "index_prose_pages_on_slug"
  add_index "prose_pages", ["template_id"], name: "index_prose_pages_on_template_id"
  add_index "prose_pages", ["title"], name: "index_prose_pages_on_title"
  add_index "prose_pages", ["visible"], name: "index_prose_pages_on_visible"

  create_table "prose_regions", force: :cascade do |t|
    t.string   "name"
    t.string   "placeholder"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "prose_template_regions", force: :cascade do |t|
    t.integer  "template_id"
    t.integer  "region_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "prose_template_regions", ["region_id"], name: "index_prose_template_regions_on_region_id"
  add_index "prose_template_regions", ["template_id"], name: "index_prose_template_regions_on_template_id"

  create_table "prose_templates", force: :cascade do |t|
    t.string   "name"
    t.string   "file_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
