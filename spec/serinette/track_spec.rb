require 'spec_helper'

describe Serinette::Track do
  context 'given a track' do
    subject(:track) { Serinette::Track.new }

    it 'should have a noise' do
      expect(track.noise).to be_a Serinette::Noise
    end

    it 'should have method render that creates a tem file and returns the path' do
      file_name = track.render
      expect(File.exist?(file_name)).to be true
    end
  end
end
