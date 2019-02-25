class Award < ApplicationRecord
  has_many :song_awards
  has_many :songs, through: :song_awards

  def num_songs
    self.songs.count(:id)
  end

  def self.top_3
    # binding.pry
    Award.joins(:songs)
    .select('awards.id, awards.name, count(songs.id)as song_count')
    .group('awards.id, awards.name')
    .order('count(songs.id) DESC')
    .limit(3)
  end

end
