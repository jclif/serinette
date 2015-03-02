module Serinette
  # Sourced Noises; will provide noises sourced from wav files found in a
  # particular directory
  class SourceNoise < Noise
    SOUND_DIRECTORY = './data/sounds/*'

    def initialize
      init_wavefile
    end

    def init_wavefile
      sox = Utils::SoxWrapper.generate_and_run input: SourceNoise.pick_random_file
      @wavefile = sox.output.path
    end

    def self.pick_random_file
      sound_files = Dir.glob(SOUND_DIRECTORY).sort
      num = (0..sound_files.length - 1).to_a.sample

      sound_files[num]
    end
  end
end
