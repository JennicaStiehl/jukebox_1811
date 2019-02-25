class Award < ApplicationRecord
  has_many :song_awards
  has_many :songs, through: :song_awards
end
