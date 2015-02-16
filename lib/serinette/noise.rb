# Most basic unit of sound; will eventually provide base class for many
# different kinds of noises (SynthNoise, SourceNoise, etc)
class Noise
  include Descendents

  # Gets a specified number of Noise subclasses.
  #
  # @param num [Fixnum] Number of noises
  # @return [Array] An array of Noise subclasses
  def self.sample_noise_classes(num = 1)
    Array.new(num).map do
      Noise.descendents.sample.new
    end
  end
end
