require 'spec_helper'

describe Serinette::SynthNoise do
  it 'should have a constant SOX_OPTIONS_CONFIG' do
    expect(Serinette::SynthNoise).to have_constant(:SOX_OPTIONS_CONFIG)
  end

  it 'should inherit from Noise' do
    expect(Serinette::SynthNoise.ancestors.include?(Serinette::Noise)).to eq(true)
  end
end
