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

ActiveRecord::Schema.define(version: 20180615081022) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entries", force: :cascade do |t|
    t.bigint "journal_id", null: false
    t.string "title", null: false
    t.text "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["journal_id"], name: "index_entries_on_journal_id"
  end

  create_table "journals", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keywords_reports", force: :cascade do |t|
    t.bigint "text_analysis_report_id", null: false
    t.string "keywords", default: [], null: false, array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["text_analysis_report_id"], name: "index_keywords_reports_on_text_analysis_report_id"
  end

  create_table "sentiment_reports", force: :cascade do |t|
    t.bigint "text_analysis_report_id", null: false
    t.string "sentiment"
    t.decimal "mixed_score"
    t.decimal "positive_score"
    t.decimal "negative_score"
    t.decimal "neutral_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["text_analysis_report_id"], name: "index_sentiment_reports_on_text_analysis_report_id"
  end

  create_table "text_analysis_reports", force: :cascade do |t|
    t.string "analysable_type", null: false
    t.bigint "analysable_id", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["analysable_type", "analysable_id"], name: "index_text_analysis_reports_on_analysable"
  end

  add_foreign_key "entries", "journals"
  add_foreign_key "keywords_reports", "text_analysis_reports"
  add_foreign_key "sentiment_reports", "text_analysis_reports"
end
