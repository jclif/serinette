require 'spec_helper'

describe Serinette::Effect do
  describe '.sample_effects' do
    it 'should exist' do
      expect(Serinette::Effect).to respond_to(:sample_effects)
    end
  end

  describe '.to_sox_key_pair' do
    it 'should exist' do
      expect(Serinette::Effect).to respond_to(:to_sox_key_pair)
    end
  end
end
