require 'rails_helper'
RSpec.describe 'as an unreg user' do
  before :each do
    @award1 = Award.create!(name: "big time")
    @award2 = Award.create!(name: "emmy")
    @artist1 = Artist.create(name: "timmica")
    @artist2 = Artist.create(name: "tim")
    @artist3 = Artist.create(name: "jo")
    @song1 = @award1.songs.create(title: "one", length: 2, play_count: 50, artist: @artist1)
    @song2 = @award2.songs.create(title: "two", length: 2, play_count: 30, artist: @artist2)
    @song3 = @award1.songs.create(title: "3", length: 2, play_count: 20, artist: @artist3)
  end
  describe 'see award show page' do
    it 'has award name and its songs' do
      visit award_path(@award1.id)
      expect(page).to have_content(@award1.name)
      expect(page).to have_content(@song1.title)
      expect(page).to have_content(@song3.title)
    end
  end
end
