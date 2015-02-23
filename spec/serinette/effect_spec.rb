require 'spec_helper'

describe Serinette::Effect do
  describe '.sample_effects_classes' do
    it 'should exist' do
      expect(Serinette::Effect).to respond_to(:sample_effects_classes)
    end
  end

  context 'given an effect' do
    subject(:effect) { Serinette::Effect.new }
    it 'should have a method #to_sox_key_pair' do
      expect(effect).to respond_to(:to_sox_key_pair)
    end
  end
end
