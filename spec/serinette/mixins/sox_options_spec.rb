require 'spec_helper'

describe Serinette::SoxOptions do
  context 'a method #randomize_options_as_string' do
    it 'should exist' do
      expect(Serinette::SoxOptions).to respond_to(:randomize_options_as_string)
    end
  end

  context 'a method #stringify_option' do
    it 'should exist' do
      expect(Serinette::SoxOptions).to respond_to(:stringify_option)
    end

    it 'should return correct string when given type: :flag' do
      good_option1 = {
        type: :flag,
        name: 'wet-only',
        value: '-w'
      }

      allow_any_instance_of(Array).to receive(:sample).and_return(true)
      expect(Serinette::SoxOptions.stringify_option(good_option1)).to eq('-w')
    end

    it 'should return correct string when given type: :trait as range' do
      good_option2 = {
        type: :trait,
        name: 'reverberance',
        value: (0..100),
        default: 50
      }

      result = Serinette::SoxOptions.stringify_option(good_option2)

      expect(result).not_to be_nil
      expect(result.to_i).to be_between(0, 100)
    end

    it 'should return correct string when given type: :trait as array' do
      good_option2 = {
        type: :trait,
        name: 'reverberance',
        value: [0, 50, 100],
        default: 50
      }

      allow_any_instance_of(Array).to receive(:sample).and_return(50)

      result = Serinette::SoxOptions.stringify_option(good_option2)

      expect(result).not_to be_nil
      expect(result.to_i).to eq(50)
    end

    it 'should return correct string when given type: :trait as proc'

    it 'should fail when type is bad' do
      bad_option = {
        type: :bad,
        name: 'wet-only',
        value: '-w'
      }

      error = Serinette::Error
      expect { Serinette::SoxOptions.stringify_option(bad_option) }.to raise_error(error)
    end
  end
end