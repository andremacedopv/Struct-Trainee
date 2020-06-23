class Genre < ApplicationRecord
  validates :descriptor, presence: true

  has_many :songs
end
