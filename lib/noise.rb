require 'wavefile'

class Noise

  attr_accessor :wavefile

  def initialize
    @wavefile = Wavefile.new
  end

end
