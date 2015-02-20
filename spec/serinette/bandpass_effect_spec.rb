require 'spec_helper'

describe BandpassEffect do
  subject(:bandpass_effect) { BandpassEffect.new }

  it 'should inherit from Effect' do
 	expect(BandpassEffect.ancestors.include?(Effect)).to eq(true)
  end
end