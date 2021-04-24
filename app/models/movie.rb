class Movie < ApplicationRecord
  has_many :bookmarks
  validates :title, uniqueness: true, presence: true
  validates :overview, uniqueness: true, presence: true
  validates :rating, inclusion: { in: (0..5),
  message: "value has to be between 1 and 5" }
end
