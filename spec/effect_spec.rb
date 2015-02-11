require 'spec_helper'
require 'effect'

describe Effect do

  subject(:effect) { Effect.new() }

  it "should have a method #to_sox_key_pair" do
    effect.should respond_to :to_sox_key_pair
  end

end
