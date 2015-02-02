require 'song'

describe Song do

  subject(:song) { Song.new() }

  it "should have an orchestrate method that creates a new wav file"

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

end
