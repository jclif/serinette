require 'spec_helper'

describe SourceNoise do
  subject(:source_noise) { SourceNoise.new }

  it 'should inherit from Noise' do
    expect(SourceNoise.ancestors.include?(Noise)).to eq(true)
  end

  it 'should have a wavefile' do
    expect(source_noise.wavefile).to be_a String
  end

  it 'should have method #render that returns post-processed sound file name' do
    file_name = source_noise.render
    expect(File.exist?(file_name)).to be true
  end
end
