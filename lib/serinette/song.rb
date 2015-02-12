require 'sox'
require 'fileutils'

class Song
  LOWEST_DURATION  = 60
  HIGHEST_DURATION = 180

  OUTPUT_FILE_NAME = 'tmp/output.wav'
  CHANNELS         = 2
  RATE             = 99600

  TRACK_NUMBER     = 2
  EFFECT_NUMBER    = 1

  attr_accessor :duration, :tracks, :effects

  def initialize
    set_duration
    set_tracks
    set_effects
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
    sox.set_effects(get_effects)

    # execute command
    sox.run
  end

  def render
    @tracks.map do |track|
      track.render
    end
  end

  private

  def get_effects
    effects_hash = {rate: RATE, channels: CHANNELS}
    @effects.each do |effect|
      effects_hash.merge! effect.to_sox_key_pair
    end
  end

  def set_duration
    @duration = (LOWEST_DURATION..HIGHEST_DURATION).to_a.sample
  end

  def set_effects
    @effects = Array.new(EFFECT_NUMBER) { Effect.get_effects(1) }
  end

  def set_tracks
    @tracks = Array.new(TRACK_NUMBER) { Track.new }
  end

  def clean
    FileUtils.rm_rf("./tmp/**/*", secure: true)
  end

end
