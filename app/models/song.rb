class Song < ApplicationRecord
  belongs_to :artist
  has_many :playlist_songs
  has_many :playlists, through: :playlist_songs
  has_many :song_awards
  has_many :awards, through: :song_awards
  validates_presence_of :title

  validates :length, presence: true, numericality: {
    greater_than_or_equal_to: 0
  }
end
