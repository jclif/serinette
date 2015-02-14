require 'spec_helper'

describe Track do
  subject(:track) { Track.new }

  it 'should have a noise' do
    expect(track.noise).to be_a Noise
  end

  it 'should have method render that creates a tem file and returns the path' do
    file_name = track.render
    expect(File.exist?(file_name)).to be true
  end
end
