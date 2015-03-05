require_relative 'effect/reverb'

module Serinette
  # Used to get subclasses and generate sox commands
  module Effect
    EFFECTS = [Reverb]

    # Gets a specified number of Effect subclasses.
    #
    # @param num [Fixnum] Number of effects
    # @return [Array] An array of Effect subclasses
    def self.sample_effects(num = 1)
      Array.new(num).map { EFFECTS.sample.new }
    end

    # Gets a key pair for a given sox effect and its args
    def self.to_sox_key_pair(object)
      { object.return_root_command => object.generate_options }
    end
  end
end
