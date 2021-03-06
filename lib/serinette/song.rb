module Serinette
  # Contains functions for kicking off initializer chain, rendering final song,
  # and constants necessary for determining song-level characteristcs
  class Song
    LOWEST_DURATION  = 60
    HIGHEST_DURATION = 180

    TRACK_NUMBER     = 2
    EFFECT_NUMBER    = 1

    CHANNELS         = 2
    RATE             = 99_600

    attr_accessor :duration, :tracks, :effects, :key

    def initialize
      init_key
      init_duration
      init_tracks
      init_effects
      init_sox

      configure_and_run
    end

    # Gets the options necessary for all sox effects
    def self.default_effects
      { rate: RATE, channels: CHANNELS }
    end

    private

    # Takes the sox variable and adds input, sets effects, sets output, and runs
    def configure_and_run
      @tracks.each do |track|
        @sox.add_input(track.wavefile)
      end
      @sox.run
    end

    # Uses effects array to generate hash of all effects as sox key/pairs
    def generate_effects_options
      effects_hash = Song.default_effects

      @effects.each do |effect|
        effects_hash.merge! Effect.to_sox_key_pair(effect)
      end

      effects_hash
    end

    # Initializes key
    def init_key
      @key = Music::Theory::Key.new
    end

    # Initializes duration
    def init_duration
      @duration = (LOWEST_DURATION..HIGHEST_DURATION).to_a.sample
    end

    # Initializes tracks
    def init_tracks
      @tracks = Array.new(TRACK_NUMBER) { Track.new @key }
    end

    # Initializes effects
    def init_effects
      @effects = Effect.sample_effects(1)
    end

    # Initializes sox command
    def init_sox
      @sox = Sox::Cmd.new(combine: :mix)
      @sox.set_effects(generate_effects_options)
      @sox.set_output(Serinette.output_path)
    end
  end
end
