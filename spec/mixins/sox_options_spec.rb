require 'spec_helper'

describe SoxOptions do

  context 'a method #randomize_effect_options_as_string' do
    it 'should exist' do
      expect(SoxOptions).to respond_to(:randomize_effect_options_as_string)
    end
  end

  context 'a method #stringify_option' do
    it 'should exist' do
      expect(SoxOptions).to respond_to(:stringify_option)
    end

    it 'should return correct string when given type: :flag' do
      good_option1 = {
        type: :flag,
        name: 'wet-only',
        value: '-w'
      }

      allow_any_instance_of(Array).to receive(:sample).and_return(true)
      expect(SoxOptions.stringify_option(good_option1)).to eq('-w')
    end

    it 'should return correct string when given type: :trait' do
      good_option2 = {
        type: :trait,
        name: 'reverberance',
        range: (0..100),
        default: 50
      }

      result =SoxOptions.stringify_option(good_option2)

      expect(result).not_to be_nil
      expect(result.to_i).to be_between(0, 100)
    end

    it 'should fail when type is bad' do
      bad_option = {
        type: :bad,
        name: 'wet-only',
        value: '-w'
      }
      expect{ SoxOptions.stringify_option(bad_option) }.to raise_error(Serinette::Error)
    end
  end
end
