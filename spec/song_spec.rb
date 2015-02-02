require 'song'

describe Song do

  describe 'the song class' do
    it 'should have a variable called samples_per_buffer' do
      expect(Song::SAMPLES_PER_BUFFER).not_to be_nil
    end
  end

  subject(:song) { Song.new() }

  it "should have a variable duration" do
    expect(song.duration).to be_a Fixnum
  end

  it "should generate a duration less than three minutes" do
    expect(song.duration).to be < 180
  end

  it "should generate a duration more than one minute" do
    expect(song.duration).to be > 60
  end

  it "should generate a track" do
    expect(song.tracks).to be_a Array
  end

  it "should have one track" do
    expect(song.tracks.length).to be 1
    expect(song.tracks.first).to be_a Track
  end


  describe "a method orchestrate" do

    it "should exist" do
      expect(Song.method_defined?(:orchestrate)).to be true
    end

    it "should call render on all tracks" do
      song.tracks.each do |track|
        expect(track).to receive(:render)
      end

      song.orchestrate
    end

    it "should set a variable wavefile with merge track wavefiles" do
      song.orchestrate
      expect(song.respond_to?(:wavefile)).to be true
      expect(song.wavefile).not_to be_nil
    end

    it "should set a variable wavefile with merge track wavefiles" do
    end

  end

end
