class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  validates :title, uniqueness: true, presence: true
  validates :overview, uniqueness: true, presence: true
end
