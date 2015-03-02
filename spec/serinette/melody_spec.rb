require 'spec_helper'

describe Serinette::ReverbEffect do
  subject(:melody) { Serinette::Melody.new }

  it 'should have a key' do
    Serinette::ReverbEffect.ancestors.include?(Serinette::Effect)
  end
end
