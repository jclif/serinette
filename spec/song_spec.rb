require 'song'

describe Song do

  describe 'The Class' do
    it 'should have a variable called OUTPUT_FILE_NAME' do
      expect(Song::OUTPUT_FILE_NAME).not_to be_nil
    end

    it 'should have a variable called TRACK_NUM' do
      expect(Song::TRACK_NUM).not_to be_nil
    end

    it 'should have a variable called CHANNELS' do
      expect(Song::CHANNELS).not_to be_nil
    end

    it 'should have a variable called RATE' do
      expect(Song::RATE).not_to be_nil
    end
  end

  subject(:song) { Song.new() }

  it "should have a variable duration stuff" do
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

  it "should have correct number of tracks" do
    expect(song.tracks.length).to be Song::TRACK_NUM
    song.tracks.each do |track|
      expect(track).to be_a Track
    end
  end

  it "should exist" do
    expect(Song.method_defined?(:orchestrate)).to be true
  end

  it "should call render on all tracks" do
    song.tracks.each do |track|
      expect(track).to receive(:render)
    end

    song.render
  end

  it "should output a file" do
    song.orchestrate
    expect(File.exist?(Song::OUTPUT_FILE_NAME)).to be true
  end

end
