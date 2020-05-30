class Album < ApplicationRecord
  validates :name, presence: true
  validates :artist, presence: true

  has_many :songs, dependent: :delete_all
end
