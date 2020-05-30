class Song < ApplicationRecord
  validates :name, presence: true
  validates :is_explicit, :inclusion => { :in => [true, false] }
  validates :album, presence: true
  validates :genre, presence: true

  belongs_to :genre
  belongs_to :album
end
