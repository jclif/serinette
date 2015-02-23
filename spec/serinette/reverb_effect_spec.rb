require 'spec_helper'

describe Serinette::ReverbEffect do
  subject(:reverb_effect) { Serinette::ReverbEffect.new }

  it 'should inherit from Effect' do
    Serinette::ReverbEffect.ancestors.include?(Serinette::Effect)
  end
end
