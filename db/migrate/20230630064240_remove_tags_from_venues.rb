class RemoveTagsFromVenues < ActiveRecord::Migration[7.0]
  def change
    remove_column :venues, :tags, :string
  end
end
