require 'spec_helper'

describe SynthNoise do
  subject(:synth_noise) { SynthNoise.new }

  it 'should inherit from Noise' do
    expect(SynthNoise.ancestors.include?(Noise)).to eq(true)
  end
end
