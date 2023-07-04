class Venue < ApplicationRecord
  has_many_attached :photos
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :name, presence: true
  validates :location, presence: true
  belongs_to :user
  has_many :tags, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy


  include PgSearch::Model
  pg_search_scope :search_by_name_location_description,
                  against: [ :name, :location, :description ],
                  using: {
                  tsearch: { prefix: true }
    }

  def check_availability(date)
    conflicting_bookings = bookings.where('start_date <= ? AND end_date >= ?', date, date)
    return true if conflicting_bookings.empty?

    false
  end
end
