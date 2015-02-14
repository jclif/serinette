require 'spec_helper'

describe ReverbEffect do

  subject(:reverb_effect) { ReverbEffect.new() }

  it "should inherit from Effect" do
    ReverbEffect.ancestors.include?(Effect)
  end

end
