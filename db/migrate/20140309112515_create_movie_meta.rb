class CreateMovieMeta < ActiveRecord::Migration
  def change
    create_table :movie_meta do |t|
      t.integer :revenue
      t.integer :length
      t.integer :budget
      t.string :poster
      t.string :homepage
      t.text :description
      t.string :tagline
      t.float :popularity
      t.date :release_date
      t.references :movie, index: true

      t.timestamps
    end
  end
end
