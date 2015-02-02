class Track

  attr_accessor :noise

  def initialize
    @noise = getNoise
  end

  def render
    return @noise.render
  end

  private

  def getNoise
    return Noise.new
  end

end
