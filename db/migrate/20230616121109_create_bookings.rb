class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :venue_id
      t.date :booking_start_date
      t.date :booking_end_date
      t.integer :amount_guests

      t.timestamps
    end
  end
end
