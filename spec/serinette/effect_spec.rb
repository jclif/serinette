require 'spec_helper'

describe Effect do
  it 'should have a constant called EXCLUDED_EFFECTS' do
  	expect(Effect::EXCLUDED_EFFECTS).not_to be_nil
  end

	context "a class function called register_exclusion" do
		it 'should exist' do
  		expect(Effect).to respond_to(:register_exclusion)
  	end

	  it 'should register a correct subclass' do
      expect(Effect::EXCLUDED_EFFECTS).to eq [CompandEffect, BandpassEffect]
    end
	end

	context "given an effect" do
	  subject(:effect) { Effect.new }

	  it 'should have a method #to_sox_key_pair' do
	    expect(effect).to respond_to(:to_sox_key_pair)
	  end

	  it 'should have a method #sample_effects_classes' do
	    expect(Effect).to respond_to(:sample_effects_classes)
	  end
	end
end