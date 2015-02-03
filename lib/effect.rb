class Effect
  TYPES = ['reverb']

  attr_accessor :type

  def initialize
    @type = TYPES.sample
  end

end
