require_relative 'noise/synth'
require_relative 'noise/source'

module Serinette
  # Most basic unit of sound; will eventually provide base class for many
  # different kinds of noises (SynthNoise, SourceNoise, etc)
  module Noise
    NOISES = [Source, Synth]

    # Gets a specified number of Noise subclasses.
    #
    # @param num [Fixnum] Number of noises
    # @return [Array] An array of Noise subclasses
    def self.sample_noises(num = 1)
      Array.new(num).map do
        NOISES.sample.new
      end
    end
  end
end
