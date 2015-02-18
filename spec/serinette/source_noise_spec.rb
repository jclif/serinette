require 'spec_helper'

describe SourceNoise do
  subject(:source_noise) { SourceNoise.new }

  it 'should inherit from Noise' do
    expect(SourceNoise.ancestors.include?(Noise)).to eq(true)
  end

  it 'should have a wavefile' do
    expect(source_noise.wavefile).to be_a String
  end
end
