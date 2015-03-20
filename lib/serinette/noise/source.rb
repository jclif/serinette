module Serinette
  module Noise
    # Sourced Noises; will provide noises sourced from wav files found in a
    # particular directory
    class Source
      SOUND_DIRECTORY = './data/sounds/*'

      attr_accessor :wavefile

      def initialize
        init_wavefile
      end

      # Initialize wavefile
      def init_wavefile
        options = { input: Source.pick_random_file, run: true }
        sox = Utils::SoxWrapper.generate options
        @wavefile = sox.output.path
      end

      # Chooses a random file from the Sound directory
      #
      # @return [string] A path to a random file
      def self.pick_random_file
        sound_files = Dir.glob(SOUND_DIRECTORY).sort
        num = (0..sound_files.length - 1).to_a.sample

        sound_files[num]
      end
    end
  end
end
