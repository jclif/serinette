class Song
  LOWEST_DURATION  = 60
  HIGHEST_DURATION = 180
  TRACK_NUMBER     = 2
  EFFECT_NUMBER    = 1

  OUTPUT_FILE_NAME = 'tmp/output.wav'
  CHANNELS         = 2
  RATE             = 99600

  attr_accessor :duration, :tracks, :effects

  def initialize
    set_duration
    set_tracks
    set_effects
  end

  def render
    @tracks.map do |track|
      track.render
    end
  end

  def configure_command(sox)
    render.each do |file|
      sox.add_input(file)
    end
    sox.set_effects(get_effects)
    sox.set_output(Serinette::OUTPUT_FILE_NAME)
  end

  private

  def set_duration
    @duration = (LOWEST_DURATION..HIGHEST_DURATION).to_a.sample
  end

  def get_effects
    effects_hash = {rate: RATE, channels: CHANNELS}
    @effects.each do |effect|
      effects_hash.merge! effect.to_sox_key_pair
    end
  end

  def set_effects
    @effects = Effect.get_effects(1)
  end

  def set_tracks
    @tracks = Array.new(TRACK_NUMBER) { Track.new }
  end

end
