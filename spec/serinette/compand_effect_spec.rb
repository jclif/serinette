require 'spec_helper'

describe CompandEffect do
  subject(:compand_effect) { CompandEffect.new }

  it 'should inherit from Effect' do
 	expect(CompandEffect.ancestors.include?(Effect)).to eq(true)
  end
end