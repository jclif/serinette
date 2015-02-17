# Has functions for kicking off initializer chain, rendering final song, and
# constants necessary for determining song-level characteristcs
class Song
  LOWEST_DURATION  = 60
  HIGHEST_DURATION = 180
  TRACK_NUMBER     = 2
  EFFECT_NUMBER    = 1

  CHANNELS         = 2
  RATE             = 99_600

  attr_accessor :duration, :tracks, :effects

  def initialize
    init_duration
    init_tracks
    init_effects
  end

  # Recurses render tree via render
  def render
    @tracks.map(&:render)
  end

  # Taks a sox instance and adds input, sets effects, and sets output
  #
  # @param sox [Sox::Cmd] Sox command instance
  def configure_command(sox)
    render.each do |file|
      sox.add_input(file)
    end
    sox.set_effects(generate_effects_options)
    sox.set_output(Serinette.generate_output_path)
  end

  private

  # Uses effects instance variable to generate hash of all effects as sox
  # key/pairs
  def generate_effects_options
    # TODO define a default hash function in serinette
    effects_hash = { rate: RATE, channels: CHANNELS }

    @effects.each do |effect|
      effects_hash.merge! effect.to_sox_key_pair
    end

    effects_hash
  end

  # Initializes duration
  def init_duration
    @duration = (LOWEST_DURATION..HIGHEST_DURATION).to_a.sample
  end

  # Initializes tracks
  def init_tracks
    @tracks = Array.new(TRACK_NUMBER) { Track.new }
  end

  # Initializes effects
  def init_effects
    @effects = Effect.sample_effects_classes(1)
  end
end
