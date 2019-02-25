require 'rails_helper'
RSpec.describe 'on the awards index page' do
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
  describe 'as an admin' do
    it 'can see awards and create a new one on same page' do
      visit admin_awards_path
      expect(page).to have_content(@award1.name)
      expect(page).to have_content(@award2.name)
    end
  end
  describe 'as an unreg user' do
    it 'can see awards, no form' do
      visit awards_path
      expect(page).to have_content(@award1.name)
      expect(page).to have_content(@award2.name)
      click_on "#{@award1.name}"
      expect(current_path).to eq(award_path(@award1.id))
    end
  end
end
