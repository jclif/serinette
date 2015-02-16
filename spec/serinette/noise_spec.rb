require 'spec_helper'

describe Noise do
  subject(:noise) { Noise.new }

  it 'should have a wavefile' do
    expect(noise.wavefile).to be_a String
  end

  it 'should have method #render return post-processed sound file name' do
    file_name = noise.render
    expect(File.exist?(file_name)).to be true
  end
end
