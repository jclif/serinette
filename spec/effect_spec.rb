require 'spec_helper'
require 'effect'

describe Effect do

  subject(:effect) { Effect.new() }

  describe 'The Class' do
    it 'should have a variable called TYPES' do
      expect(Effect::TYPES).not_to be_nil
    end
  end

  it "should have a type" do
    expect(effect.type).to be_a(String)
  end

end
