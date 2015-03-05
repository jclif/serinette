module Serinette
  module Utils
    # Provides Sox helper functions
    module SoxWrapper
      # Takes options and generates a configured Sox::Cmd
      #
      # @param [Hash] options hash
      # @return [Sox::Cmd] Sox commands with all configurations
      def self.generate(options = {})
        options[:global_options] ||= {}
        options[:run] ||= false
        options[:input] ||= '-n'
        options[:output] ||= FileName.generate
        options[:effects] ||= {}
        options[:effects].merge! Song.default_effects

        setup(options)
      end

      private

      # Internal function for setting up and running (if :run) sox command
      def self.setup(options)
        sox = Sox::Cmd.new options[:global_options]

        sox.add_input(options[:input])
        sox.set_effects(options[:effects])
        sox.set_output(options[:output])

        sox.run if options[:run]
        sox
      end
    end
  end
end
