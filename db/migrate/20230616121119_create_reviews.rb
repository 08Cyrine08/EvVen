class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :venue_id
      t.string :title
      t.text :text
      t.integer :rating
      t.date :date

      t.timestamps
    end
  end
end
