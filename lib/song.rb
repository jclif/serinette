require 'wavefile'
require 'fileutils'

include WaveFile

class Song

  SAMPLES_PER_BUFFER = 4096
  OUTPUT_FILE_NAME = 'tmp/output.wav'
  TRACK_NUM = 2

  attr_accessor :duration, :tracks

  def initialize
    setDuration
    setTracks
  end

  def orchestrate
    clean
    track_files = render

    puts track_files.inspect
    Writer.new(OUTPUT_FILE_NAME, Format.new(:stereo, :pcm_16, 44100)) do |writer|
      track_files.each do |file_name|
        Reader.new(file_name).each_buffer(SAMPLES_PER_BUFFER) do |buffer|
          writer.write(buffer)
        end
      end
    end
  end

  def render
    @tracks.map do |track|
      track.render
    end
  end

  private

  def setDuration
    @lowest_duration = 60
    @highest_duration = 180

    @duration = (@lowest_duration..@highest_duration).to_a.sample
  end

  def setTracks
    @tracks = []
    TRACK_NUM.times do |i|
      @tracks << Track.new
    end
  end

  def clean
    dir_path = 'tmp'
    FileUtils.rm_rf("#{dir_path}/.", secure: true)
  end

end
