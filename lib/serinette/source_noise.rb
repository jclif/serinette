# Sourced Noises; will provide noises sourced from wav files found in a
# particular directory
class SourceNoise < Noise
  SOUND_DIRECTORY = './sounds/*'

  def initialize
    init_wavefile
  end

  def init_wavefile
    sound_files = Dir.glob(SOUND_DIRECTORY).sort
    num = (0..sound_files.length - 1).to_a.sample

    chosen_file = sound_files[num]
    # Now we need to process that file so that it has the default rate/channels
    sox_options = {
      input: chosen_file,
      output: FileName.generate
    }
    SoxWrapper.generate_and_run(sox_options)
    @wavefile = sox_options[:output]
  end
end
