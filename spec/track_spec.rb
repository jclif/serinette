require 'track'

describe Track do

  subject(:track) { Track.new() }

  it "should generate a noise" do
    expect(track.noise).to be_a Noise
  end

end
