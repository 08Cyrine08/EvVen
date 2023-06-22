class RemoveDateFromReviews < ActiveRecord::Migration[7.0]
  def change
    remove_column :reviews, :date, :date
  end
end
