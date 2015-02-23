require 'spec_helper'

describe Serinette::SourceNoise do

  it 'should inherit from Noise' do
    expect(Serinette::SourceNoise.ancestors.include?(Serinette::Noise)).to eq(true)
  end

  context 'given a source noise' do
    subject(:source_noise) { Serinette::SourceNoise.new }

    it 'should have a wavefile' do
      expect(source_noise.wavefile).to be_a String
    end
  end
end
