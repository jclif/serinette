require 'spec_helper'

describe Serinette::Noise do
  describe '.sample_effects' do
    it 'should exist' do
      expect(Serinette::Noise).to respond_to(:sample_noises)
    end
  end
end
