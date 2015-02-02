require 'wavefile'

class Noise

  attr_accessor :wavefile

  def initialize
    sound_files = Dir.glob('./sounds/*').sort
    num = (0..sound_files.length-1).to_a.sample
    @wavefile = sound_files[num]
  end

  def render
    return @wavefile
  end

end
