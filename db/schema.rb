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

ActiveRecord::Schema.define(version: 20160711053304) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "quantity"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "product_variant_id"
  end

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts_product_variants", id: false, force: :cascade do |t|
    t.integer "cart_id"
    t.integer "product_variant_id"
  end

  add_index "carts_product_variants", ["cart_id"], name: "index_carts_product_variants_on_cart_id", using: :btree
  add_index "carts_product_variants", ["product_variant_id"], name: "index_carts_product_variants_on_product_variant_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_products", id: false, force: :cascade do |t|
    t.integer "category_id"
    t.integer "product_id"
  end

  add_index "categories_products", ["category_id"], name: "index_categories_products_on_category_id", using: :btree
  add_index "categories_products", ["product_id"], name: "index_categories_products_on_product_id", using: :btree

  create_table "colors", force: :cascade do |t|
    t.string   "product_color"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "hex_value"
  end

  create_table "orders", force: :cascade do |t|
    t.string   "stripeShippingAddressLine1"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "cart_id"
    t.integer  "stripeShippingAddressZip"
    t.string   "stripeShippingAddressCity"
    t.string   "stripeShippingAddressCountry"
    t.integer  "stripeShippingAddressCountryCode"
  end

  create_table "product_variants", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "size_id"
    t.integer  "color_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "quantity"
    t.datetime "deleted_at"
  end

  add_index "product_variants", ["deleted_at"], name: "index_product_variants_on_deleted_at", using: :btree

  create_table "products", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "brand_id"
    t.string   "title"
    t.string   "style"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.text     "description"
    t.text     "photo_url"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.float    "price"
    t.float    "discount",           default: 0.0
  end

  create_table "sizes", force: :cascade do |t|
    t.integer  "product_size"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role",              default: "basic"
    t.string   "remember_digest"
    t.string   "username"
    t.string   "reset_digest"
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.string   "api_token"
  end

  add_foreign_key "carts_product_variants", "carts"
  add_foreign_key "carts_product_variants", "product_variants"
  add_foreign_key "categories_products", "categories"
  add_foreign_key "categories_products", "products"
end
