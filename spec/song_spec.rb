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

  it "should have correct number of tracks" do
    expect(song.tracks.length).to be Song::TRACK_NUM
    song.tracks.each do |track|
      expect(track).to be_a Track
    end
  end

  it "should exist" do
    expect(Song.method_defined?(:orchestrate)).to be true
  end

  it "should have a class variable called SAMPLES_PER_BUFFER" do
    expect(Song::SAMPLES_PER_BUFFER).not_to be_nil
  end

  it "should have a class variable called OUTPUT_FILE_NAME" do
    expect(Song::OUTPUT_FILE_NAME).not_to be_nil
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
