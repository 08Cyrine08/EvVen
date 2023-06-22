class Review < ApplicationRecord
  validates :text, presence: true
  validates :rating, presence: true, inclusion: { in: 1..5 }
  belongs_to :venue
end
