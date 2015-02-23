require 'spec_helper'

describe Serinette::Noise do
  it 'should have a method #sample_noise_classes' do
    expect(Serinette::Noise).to respond_to(:sample_noise_classes)
  end
end
