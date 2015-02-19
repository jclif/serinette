require 'spec_helper'

describe SynthNoise do
  it 'should have a constant SOX_OPTIONS_CONFIG' do
    expect(SynthNoise::SOX_OPTIONS_CONFIG.nil?).to eq(false)
  end

  it 'should inherit from Noise' do
    expect(SynthNoise.ancestors.include?(Noise)).to eq(true)
  end

  it 'should have a method #generate_noise that' do
    expect(SynthNoise.ancestors.include?(Noise)).to eq(true)
  end
end
