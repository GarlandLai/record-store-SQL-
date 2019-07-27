require('capybara/rspec')
require('./app')
require('spec_helper')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)
#
# describe('create an album path', {:type => :feature}) do
#   it('creates an album and then goes to the album page') do
#     visit('/albums')
#     click_on('Add a new album')
#     fill_in('album_name', :with => 'Yellow Submarine')
#     # fill_in('album_artist', :with => 'Joe')
#     # fill_in('album_genre', :with => 'Rock')
#     # fill_in('album_year', :with => '2000')
#     click_on('add_album')
#     expect(page).to have_content('Yellow Submarine')
#   end
# end
#
# describe('create a song path', {:type => :feature}) do
#   it('creates an album and then goes to the album page') do
#     album = Album.new("Yellow Submarine", "Joe", "Crabs","2", nil)
#     album.save
#     visit("/albums/#{album.id}")
#     fill_in('song_name', :with => 'All You Need Is Love')
#     click_on('Add song')
#     expect(page).to have_content('All You Need Is Love')
#   end
# end
