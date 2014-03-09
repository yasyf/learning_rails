class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :user
      t.text :body
      t.references :movie, index: true

      t.timestamps
    end
  end
end
