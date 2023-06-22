class Booking < ApplicationRecord
  validates :booking_start_date, presence: true
  validates :booking_end_date, presence: true
  belongs_to :user
  belongs_to :venue
end
