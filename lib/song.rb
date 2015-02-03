require 'sox'
require 'fileutils'

class Song
  LOWEST_DURATION = 60
  HIGHEST_DURATION = 180

  OUTPUT_FILE_NAME = 'tmp/output.wav'
  CHANNELS         = 2
  RATE             = 99600

  TRACK_NUM        = 2
  EFFECT_NUM       = 1

  attr_accessor :duration, :tracks, :effects

  def initialize
    setDuration
    setTracks
    setEffects
  end

  def orchestrate
    # clear tmp dir
    clean

    # get file names from tracks
    track_files = render

    # build sox command
    sox = Sox::Cmd.new(:combine => :mix)

    track_files.each do |file|
      sox.add_input(file)
    end

    sox.set_output(OUTPUT_FILE_NAME)
    sox.set_effects(rate: RATE, channels: CHANNELS, effects[0].type => true)

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
    @duration = (LOWEST_DURATION..HIGHEST_DURATION).to_a.sample
  end

  def setEffects
    @effects = Array.new(EFFECT_NUM) { Effect.new }
  end

  def setTracks
    @tracks = Array.new(TRACK_NUM) { Track.new }
  end

  def clean
    FileUtils.rm_rf("./tmp/**/*", secure: true)
  end

end
