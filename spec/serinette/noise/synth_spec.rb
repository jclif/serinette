require 'spec_helper'

describe Serinette::Noise::Synth do
  it 'should have a constant SOX_OPTIONS_CONFIG' do
    expect(Serinette::Noise::Synth).to have_constant(:SOX_OPTIONS_CONFIG)
  end
end
