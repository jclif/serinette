require 'sox'
require 'fileutils'

include WaveFile

class Song

  OUTPUT_FILE_NAME = 'tmp/output.wav'
  TRACK_NUM        = 2
  CHANNELS         = 2
  RATE             = 44100

  attr_accessor :duration, :tracks

  def initialize
    setDuration
    setTracks
  end

  def orchestrate
    # clear tmp dir
    clean

    # get file names from tracks
    track_files = render

    # build sox command
    sox = Sox::Cmd.new(:combine => :mix)

    puts track_files.inspect
    track_files.each do |file|
      sox.add_input(file)
    end

    sox.set_output(OUTPUT_FILE_NAME)
    sox.set_effects(rate: RATE, channels: CHANNELS)

    # execute command
    sox.run
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
    @tracks = Array.new(TRACK_NUM) { Track.new }
  end

  def clean
    FileUtils.rm_rf("./tmp/**/*", secure: true)
  end

end
