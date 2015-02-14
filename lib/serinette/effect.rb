# Used to get subclasses and generate sox commands
class Effect
  include Descendents

  def self.sample_effects_classes(num)
    # Gets a specified number of Effect subclasses.
    #
    # @param num [Fixnum] Number of effects
    # @return [Array] An array of Effect subclasses
    Array.new(num).map do
      Effect.descendents.sample.new
    end
  end

  def to_sox_key_pair
    # Gets a key pair for a given sox effect and its args
    { return_root_command => generate_options }
  end
end
