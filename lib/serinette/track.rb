module Serinette
  # Contains noise, efects on noise, and when (timestamps) and
  # how (volume) noise is played
  class Track
    attr_accessor :noise, :key, :wavefile

    def initialize(key)
      init_noise
      @key = key
      render
    end

    private

    # Initializes noise
    def init_noise
      @noise = Noise.sample_noises(1).first
    end

    # For now, just gets the wavefile from its noise
    def render
      @wavefile = @noise.wavefile
    end
  end
end
