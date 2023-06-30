class Booking < ApplicationRecord
  validates :booking_start_date, presence: true
  validates :booking_end_date, presence: true
  belongs_to :user
  belongs_to :venue

  def booking_dates_cannot_be_in_the_past
    if booking_start_date && booking_start_date < Date.today
      errors.add(:booking_start_date, "cannot be in the past")
    end

    if booking_end_date && booking_end_date < Date.today
      errors.add(:booking_end_date, "cannot be in the past")
    end
  end
end
