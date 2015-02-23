module Serinette
  # Contains noise, efects on noise, and when (timestamps) and
  # how (volume) noise is played
  class Track
    attr_accessor :noise

    def initialize
      @noise = init_noise
    end

    # For now, just returns the result of noises render; this will be where
    # the noise is brought in and out of the song
    def render
      @noise.wavefile
    end

    private

    # Initializes noise
    def init_noise
      Noise.sample_noise_classes.first.new
    end
  end
end
