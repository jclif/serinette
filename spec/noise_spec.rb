require 'spec_helper'
require 'serinette/noise'

describe Noise do

  subject(:noise) { Noise.new() }

  it "should have a wavefile" do
    expect(noise.wavefile).to be_a String
  end

  it "should have a method render that: creates temporary wav file; returns name" do
    file_name = noise.render
    expect(File.exist?(file_name)).to be true
  end

end
