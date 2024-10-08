# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_09_183807) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.string "author", null: false
    t.string "cover_image_thumb_s3_key", null: false
    t.string "cover_image_full_s3_key", null: false
    t.text "amazon_link"
  end

  create_table "chapters", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "book_id", null: false
    t.integer "position", null: false
    t.string "name", null: false
    t.text "text_s3_key", null: false
    t.index ["book_id"], name: "index_chapters_on_book_id"
  end

  create_table "club_memberships", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "club_id", null: false
    t.bigint "user_id", null: false
    t.index ["club_id", "user_id"], name: "index_club_memberships_on_club_id_and_user_id", unique: true
    t.index ["club_id"], name: "index_club_memberships_on_club_id"
    t.index ["user_id"], name: "index_club_memberships_on_user_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "book_id", null: false
    t.bigint "organizer_id", null: false
    t.string "status", null: false
    t.string "passcode", null: false
    t.boolean "sunday", default: false, null: false
    t.boolean "monday", default: false, null: false
    t.boolean "tuesday", default: false, null: false
    t.boolean "wednesday", default: false, null: false
    t.boolean "thursday", default: false, null: false
    t.boolean "friday", default: false, null: false
    t.boolean "saturday", default: false, null: false
    t.index ["book_id"], name: "index_clubs_on_book_id"
    t.index ["organizer_id"], name: "index_clubs_on_organizer_id"
    t.index ["passcode"], name: "index_clubs_on_passcode"
  end

  create_table "contact_messages", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "reply_email", null: false
    t.text "message", null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "scheduled_chapter_emails", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "subscription_id", null: false
    t.bigint "chapter_id", null: false
    t.datetime "sent_at"
    t.integer "position", null: false
    t.index ["chapter_id"], name: "index_scheduled_chapter_emails_on_chapter_id"
    t.index ["subscription_id"], name: "index_scheduled_chapter_emails_on_subscription_id"
  end

  create_table "scheduled_club_emails", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "club_id", null: false
    t.bigint "chapter_id", null: false
    t.datetime "sent_at"
    t.integer "position", null: false
    t.index ["chapter_id"], name: "index_scheduled_club_emails_on_chapter_id"
    t.index ["club_id"], name: "index_scheduled_club_emails_on_club_id"
  end

  create_table "stripe_customer_subscriptions", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.string "subscription_id", null: false
    t.string "customer_id", null: false
    t.string "payment_method_id"
    t.string "price_id", null: false
    t.string "status", null: false
    t.bigint "current_period_end", null: false
    t.index ["user_id"], name: "index_stripe_customer_subscriptions_on_user_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "book_id", null: false
    t.bigint "user_id", null: false
    t.string "status", null: false
    t.boolean "sunday", default: false, null: false
    t.boolean "monday", default: false, null: false
    t.boolean "tuesday", default: false, null: false
    t.boolean "wednesday", default: false, null: false
    t.boolean "thursday", default: false, null: false
    t.boolean "friday", default: false, null: false
    t.boolean "saturday", default: false, null: false
    t.index ["book_id"], name: "index_subscriptions_on_book_id"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "user_favorite_books", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.bigint "book_id", null: false
    t.index ["book_id"], name: "index_user_favorite_books_on_book_id"
    t.index ["user_id"], name: "index_user_favorite_books_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.string "email", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "stripe_customer_id"
    t.jsonb "stripe_subscription_data"
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["stripe_customer_id"], name: "index_users_on_stripe_customer_id"
    t.index ["unconfirmed_email"], name: "index_users_on_unconfirmed_email"
  end

  add_foreign_key "chapters", "books"
  add_foreign_key "club_memberships", "clubs"
  add_foreign_key "club_memberships", "users"
  add_foreign_key "clubs", "books"
  add_foreign_key "clubs", "users", column: "organizer_id"
  add_foreign_key "scheduled_chapter_emails", "chapters"
  add_foreign_key "scheduled_chapter_emails", "subscriptions"
  add_foreign_key "scheduled_club_emails", "chapters"
  add_foreign_key "scheduled_club_emails", "clubs"
  add_foreign_key "stripe_customer_subscriptions", "users"
  add_foreign_key "subscriptions", "books"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "user_favorite_books", "books"
  add_foreign_key "user_favorite_books", "users"
end
