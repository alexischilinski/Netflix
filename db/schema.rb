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

ActiveRecord::Schema.define(version: 2019_12_03_235827) do

  create_table "genres", force: :cascade do |t|
    t.string "name"
  end

  create_table "movie_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "movie_id"
    t.index ["movie_id"], name: "index_movie_users_on_movie_id"
    t.index ["user_id"], name: "index_movie_users_on_user_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.integer "genre_id"
    t.string "rating"
    t.integer "year"
    t.string "cast"
    t.float "star_rating"
    t.index ["genre_id"], name: "index_movies_on_genre_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
  end

  add_foreign_key "movie_users", "movies"
  add_foreign_key "movie_users", "users"
  add_foreign_key "movies", "genres"
end
