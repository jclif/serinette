require 'spec_helper'

describe Effect do
  subject(:effect) { Effect.new }

  it 'should have a method #to_sox_key_pair' do
    expect(effect).to respond_to(:to_sox_key_pair)
  end

  it 'should have a method #sample_effects_classes' do
    expect(Effect).to respond_to(:sample_effects_classes)
  end
end
