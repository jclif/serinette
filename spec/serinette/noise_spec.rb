require 'spec_helper'

describe Noise do
  subject(:noise) { Noise.new }

  it 'should have a method #sample_noise_classes' do
    expect(Noise).to respond_to(:sample_noise_classes)
  end
end
