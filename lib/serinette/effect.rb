class Effect
  # Used to get subclasses and generate sox commands

  include Descendents

  def self.get_effects(num)
    # Gets a specified number of Effect subclasses.
    #
    # @param num [Fixnum] Number of effects
    # @return [Array] An array of Effect subclasses
    Array.new(num).map do |el|
      el = Effect.descendents.sample.new
    end
  end

  def to_sox_key_pair
    # Gets a key pair for a given sox effect and its args
    return {get_root_command => get_options}
  end

end
