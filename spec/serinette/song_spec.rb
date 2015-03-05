require 'spec_helper'

describe Serinette::Song do
  it 'should have a constant TRACK_NUMBER' do
    expect(Serinette::Song).to have_constant(:TRACK_NUMBER)
  end

  it 'should have a constant EFFECT_NUMBER' do
    expect(Serinette::Song).to have_constant(:EFFECT_NUMBER)
  end

  it 'should have a constant CHANNELS' do
    expect(Serinette::Song).to have_constant(:CHANNELS)
  end

  it 'should have a constant RATE' do
    expect(Serinette::Song).to have_constant(:RATE)
  end

  describe '.default_effects' do
    it 'should exist' do
      expect(Serinette::Song).to respond_to(:default_effects)
    end

    it 'should get output path' do
      de = { rate: Serinette::Song::RATE, channels: Serinette::Song::CHANNELS }
      expect(Serinette::Song.default_effects).to eq de
    end
  end

  context 'given a song' do
    subject(:song) { Serinette::Song.new }

    it 'should have correct number of effects' do
      expect(song.effects.length).to be Serinette::Song::EFFECT_NUMBER
    end

    it 'should have correct number of tracks' do
      expect(song.tracks.length).to be Serinette::Song::TRACK_NUMBER
    end

    it 'should have a variable duration' do
      expect(song.duration).to be_a Fixnum
    end

    it 'should have a duration less than three minutes' do
      expect(song.duration).to be <= 180
    end

    it 'should have a duration more than one minute' do
      expect(song.duration).to be >= 60
    end

    it 'should have tracks' do
      expect(song.tracks).to be_a Array
    end

    it 'should have effects' do
      expect(song.effects).to be_a Array
    end

    it 'should have correct number of tracks' do
      expect(song.tracks.length).to be Serinette::Song::TRACK_NUMBER
      song.tracks.each do |track|
        expect(track).to be_a Serinette::Track
      end
    end

    it 'should call render on all tracks' do
      song.tracks.each do |track|
        expect(track).to receive(:render)
      end

      song.render
    end
  end
end
