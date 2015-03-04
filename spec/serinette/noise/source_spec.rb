require 'spec_helper'

describe Serinette::Noise::Source do

  context 'given a source noise' do
    subject(:source_noise) { Serinette::Noise::Source.new }

    it 'should have a wavefile' do
      expect(source_noise.wavefile).to be_a String
    end
  end
end
