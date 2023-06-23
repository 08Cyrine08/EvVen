class Venue < ApplicationRecord
  has_many_attached :photos
  validates :name, presence: true
  validates :location, presence: true
  belongs_to :user
  has_many :bookings
  has_many :reviews

  def check_availability(date)
    conflicting_bookings = bookings.where('start_date <= ? AND end_date >= ?', date, date)
    return true if conflicting_bookings.empty?

    false
  end
end
