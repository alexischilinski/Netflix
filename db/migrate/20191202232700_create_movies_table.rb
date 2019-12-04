class CreateMoviesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.references :genre, foreign_key: true
      t.string :rating
      t.integer :year
      t.string :cast
      t.float :star_rating
    end
  end
end
