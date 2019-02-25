require 'rails_helper'
RSpec.describe 'as an unreg user' do
  before :each do
    @award1 = Award.create!(name: "big time")
    @award2 = Award.create!(name: "emmy")
    @artist1 = Artist.create(name: "timmica")
    @artist2 = Artist.create(name: "tim")
    @artist3 = Artist.create(name: "jo")
    @song1 = @award1.songs.create(title: "one", length: 2, play_count: 50, artist: @artist1)
    @award3 = @song1.awards.create(name: "The Only")
    @song2 = @award2.songs.create(title: "two", length: 2, play_count: 30, artist: @artist2)
    @song3 = @award1.songs.create(title: "3", length: 2, play_count: 20, artist: @artist3)
  end
  describe 'on the song show page' do
    it 'can see a list of awards for this song' do
      visit song_path(@song1.id)
      expect(page).to have_content(@award1.name)
      expect(page).to have_content(@award3.name)
    end
  end
end
