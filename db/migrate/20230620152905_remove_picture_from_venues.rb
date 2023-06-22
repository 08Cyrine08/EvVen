class RemovePictureFromVenues < ActiveRecord::Migration[7.0]
  def change
    remove_column :venues, :picture, :string
  end
end
