require 'noise'
require 'wavefile'

describe Noise do

  subject(:noise) { Noise.new() }

  it "should have a wavefile" do
    expect(noise.wavefile).to be_a Wavefile
  end

end
