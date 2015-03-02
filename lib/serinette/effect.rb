module Serinette
  # Used to get subclasses and generate sox commands
  class Effect
    include Mixins::Descendents
    include Mixins::SoxOptions

    # Gets a specified number of Effect subclasses.
    #
    # @param num [Fixnum] Number of effects
    # @return [Array] An array of Effect subclasses
    def self.sample_effects_classes(num)
      Array.new(num).map do
        Effect.descendents.sample.new
      end
    end

    # Gets a key pair for a given sox effect and its args
    def to_sox_key_pair
      { return_root_command => generate_options }
    end
  end
end
