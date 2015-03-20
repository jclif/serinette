require 'spec_helper'

describe Serinette::Track do
  context 'given a track' do
    subject(:track) { Serinette::Track.new Serinette::Music::Theory::Key.new }

    it 'should have a noise' do
      expect(Serinette::Noise::NOISES).to include track.noise.class
    end

    it 'should have a key' do
      expect(track.key).to be_a Serinette::Music::Theory::Key
    end
  end
end
