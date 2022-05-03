class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string "title"
      t.integer "release_year"
      t.string "mpaa_rating"
      t.integer "studio_id"
      
      t.timestamps
    end
  end
end
