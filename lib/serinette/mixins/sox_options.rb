module Serinette
  module Mixins
    # Gives mixed in classes a method for randomizing effect options
    module SoxOptions
      # Takes a sox effect config and returns randomized Hash.
      #
      # @param configs [Array] Sox effect options config
      #
      # @return [string] To be used with Sox::Cmd.set_effects
      def self.randomize_options_as_string(configs)
        configs.map { |o| stringify_option(o) }.compact.join(' ')
      end

      # Takes an individual option and checks for type, (if flag, its either on
      # or off; if trait, randomize within the range given
      #
      # @param option [Option] Sox effect option
      # @return [string] To be used with Sox::Cmd.set_effects
      def self.stringify_option(option)
        case option[:type]
        when :flag
          return [true, false].sample ? option[:value] : nil
        when :trait
          return process_trait(option[:value])
        else
          fail Serinette::Error, '#stringify_option type must be flag or trait'
        end
      end

      # Gets a random value for a sox effect option node
      #
      # @param trait [Range || Array || Proc] what kind of attr the node is
      # @return [Object] Randomized value determined by trait
      def self.process_trait(trait)
        case trait
        when Range
          return trait.to_a.sample
        when Array
          return trait.sample
        when Proc
          return trait.call
        else
          fail Serinette::Error, '#process_trait requires Array, Range, or Proc'
        end
      end
    end
  end
end
