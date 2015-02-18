# Sourced Noises; will provide noises sourced from wav files found in a
# particular directory
class SourceNoise < Noise
  SOUND_DIRECTORY = './sounds/*'

  def initialize
    sound_files = Dir.glob(SOUND_DIRECTORY).sort
    num = (0..sound_files.length - 1).to_a.sample

    @wavefile = sound_files[num]
  end
end
