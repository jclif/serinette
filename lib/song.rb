require 'wavefile'
include WaveFile

class Song

  SAMPLES_PER_BUFFER = 4096

  attr_accessor :duration, :tracks, :wavefile

  def initialize
    setDuration
    setTracks
  end

  def orchestrate
    track_files = @tracks.map do |track|
      track.render
    end

    song_wavefile_name = 'tmp/song_name.wav'

    Writer.new(song_wavefile_name, Format.new(:stereo, :pcm_16, 44100)) do |writer|
      track_files.each do |file_name|
        puts file_name
        Reader.new(file_name).each_buffer(SAMPLES_PER_BUFFER) do |buffer|
          writer.write(buffer)
        end
      end
    end

    @wavefile = song_wavefile_name
  end

  private

  def setDuration
    @lowest_duration = 60
    @highest_duration = 180

    @duration = (@lowest_duration..@highest_duration).to_a.sample
  end

  def setTracks
    @tracks = [Track.new]
  end

end
