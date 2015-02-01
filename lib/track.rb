class Track

  attr_accessor :noise

  def initialize
    @noise = getNoise
  end

  private

  def getNoise
    return Noise.new
  end

end
