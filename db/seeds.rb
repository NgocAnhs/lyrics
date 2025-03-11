# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


songs_master = YAML.load_file('db/master/songs.yml')
if Song.count.zero?
  songs_master.each do |song_master|
    song = Song.find_or_initialize_by(name: song_master['name'])
    song.lyrics = File.read(Rails.root.join(song_master['lyrics_filename']))
    song.save
  end
end
