require 'track'

describe Track do

  subject(:track) { Track.new() }

  it "should have a noise" do
    expect(track.noise).to be_a Noise
  end

  it "should have a method render that: creates temporary wav file; returns name" do
    file_name = track.render
    expect(File.exist?(file_name)).to be true
  end

end
