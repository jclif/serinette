require 'spec_helper'

describe SynthNoise do
  subject(:synth_noise) { SynthNoise.new }

  it 'should inherit from SynthNoise' do
    SynthNoise.ancestors.include?(Noise)
  end
end
