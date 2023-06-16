class CreateVenues < ActiveRecord::Migration[7.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :location
      t.text :description
      t.decimal :price
      t.text :availability_dates
      t.string :tags
      t.integer :user_id
      t.string :picture

      t.timestamps
    end
  end
end
