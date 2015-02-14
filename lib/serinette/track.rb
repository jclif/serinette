# Contains noise, efects on noise, and when (timestamps) and
# how (volume) noise is played
class Track
  attr_accessor :noise

  def initialize
    @noise = init_noise
  end

  def render
    @noise.render
  end

  private

  def init_noise
    Noise.new
  end
end
