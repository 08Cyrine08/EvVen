class AddReasonAndProfessionToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :user_profession, :string
    add_column :bookings, :reason_for_booking, :text
  end
end
