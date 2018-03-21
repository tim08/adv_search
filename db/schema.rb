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

ActiveRecord::Schema.define(version: 20180321081538) do

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "articles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.text "body"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.integer "logo_file_size"
    t.datetime "logo_updated_at"
    t.bigint "company_id"
    t.bigint "admin_id"
    t.boolean "verified", default: false
    t.index ["admin_id"], name: "index_articles_on_admin_id"
    t.index ["company_id"], name: "index_articles_on_company_id"
  end

  create_table "cities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities_companies", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "company_id", null: false
    t.bigint "city_id", null: false
    t.index ["city_id", "company_id"], name: "index_cities_companies_on_city_id_and_company_id"
    t.index ["company_id", "city_id"], name: "index_cities_companies_on_company_id_and_city_id"
  end

  create_table "companies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.string "unconfirmed_email"
    t.datetime "confirmation_sent_at"
    t.boolean "promo", default: false
    t.boolean "direct_mail", default: false
    t.boolean "outdoor_ads", default: false
    t.boolean "transport_ads", default: false
    t.boolean "indoor_ads", default: false
    t.boolean "mass_media", default: false
    t.boolean "tv_ads", default: false
    t.boolean "internet_ids", default: false
    t.boolean "salepoint_ads", default: false
    t.boolean "print_services", default: false
    t.boolean "production_promotional_materials", default: false
    t.boolean "install_adv_constructions", default: false
    t.boolean "marketing_research", default: false
    t.boolean "product_placement", default: false
    t.boolean "design_services", default: false
    t.boolean "radio_ads", default: false
    t.integer "min_order_price"
    t.text "description"
    t.integer "common_exp"
    t.string "phone_contact"
    t.string "email_contact"
    t.string "address_contact"
    t.string "slogan"
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.integer "logo_file_size"
    t.datetime "logo_updated_at"
    t.boolean "verified", default: false
    t.date "expiration_date_of_premium", default: "1987-09-14"
    t.date "date_foundation"
    t.string "company_site"
    t.string "mobile_phone_contact"
    t.text "widget_contact_details"
    t.index ["confirmation_token"], name: "index_companies_on_confirmation_token", unique: true
    t.index ["email"], name: "index_companies_on_email", unique: true
    t.index ["reset_password_token"], name: "index_companies_on_reset_password_token", unique: true
  end

  create_table "premium_payments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "amount"
    t.string "uid"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_premium_payments_on_company_id"
  end

  create_table "projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.bigint "company_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.integer "logo_file_size"
    t.datetime "logo_updated_at"
    t.string "client"
    t.index ["company_id"], name: "index_projects_on_company_id"
  end

  create_table "promo_requests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "min_order_price"
    t.text "description"
    t.string "contact_details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "adv_type", default: "0"
    t.integer "status", default: 0
    t.string "contact_email"
    t.bigint "city_id"
    t.datetime "verified_at"
    t.bigint "company_id"
    t.index ["city_id"], name: "index_promo_requests_on_city_id"
    t.index ["company_id"], name: "index_promo_requests_on_company_id"
  end

  create_table "reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "type_review"
    t.integer "company_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "verified", default: false
    t.string "p_city"
  end

  add_foreign_key "premium_payments", "companies"
  add_foreign_key "projects", "companies"
  add_foreign_key "promo_requests", "cities"
  add_foreign_key "promo_requests", "companies"
end
