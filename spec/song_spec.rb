require 'song'

describe Song do

  subject(:song) { Song.new() }

  it "should have an orchestrate method"

  # it "should have a variable duration" do
  #   expect(song)
  # end

  it "should generate a duration less than three minutes" do
    expect(song.duration).to be < 180
  end

  it "should generate a duration more than one minute" do
    expect(song.duration).to be > 60
  end

end
