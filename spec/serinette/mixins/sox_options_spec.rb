require 'spec_helper'

describe Serinette::Mixins::SoxOptions do
  context 'a method #randomize_options_as_string' do
    it 'should exist' do
      func_name = :randomize_options_as_string
      expect(Serinette::Mixins::SoxOptions).to respond_to(func_name)
    end
  end

  context 'a method #stringify_option' do
    it 'should exist' do
      expect(Serinette::Mixins::SoxOptions).to respond_to(:stringify_option)
    end

    it 'should return correct string when given type: :flag' do
      good_option1 = {
        type: :flag,
        name: 'wet-only',
        value: '-w'
      }

      allow_any_instance_of(Array).to receive(:sample).and_return(true)
      o_string = Serinette::Mixins::SoxOptions.stringify_option(good_option1)
      expect(o_string).to eq('-w')
    end

    it 'should return correct string when given type: :trait as range' do
      good_option = {
        type: :trait,
        name: 'reverberance',
        value: (0..100),
        default: 50
      }

      result = Serinette::Mixins::SoxOptions.stringify_option(good_option)

      expect(result).not_to be_nil
      expect(result.to_i).to be_between(0, 100)
    end

    it 'should return correct string when given type: :trait as array' do
      good_option = {
        type: :trait,
        name: 'reverberance',
        value: [0, 50, 100],
        default: 50
      }

      allow_any_instance_of(Array).to receive(:sample).and_return(50)

      result = Serinette::Mixins::SoxOptions.stringify_option(good_option)

      expect(result).not_to be_nil
      expect(result.to_i).to eq(50)
    end

    it 'should return correct string when given type: :trait as proc' do
      good_option = {
        type: :trait,
        name: 'reverberance',
        value: proc { %w('A2', 'A3', 'A4').sample },
        default: 'A4'
      }

      allow_any_instance_of(Array).to receive(:sample).and_return('A4')

      result = Serinette::Mixins::SoxOptions.stringify_option(good_option)

      expect(result).not_to be_nil
      expect(result).to eq('A4')
    end

    it 'should fail when type is bad' do
      bad_option = {
        type: :bad,
        name: 'wet-only',
        value: '-w'
      }

      error = Serinette::Error
      bad_call = proc do
        Serinette::Mixins::SoxOptions.stringify_option(bad_option)
      end
      expect { bad_call.yield }.to raise_error(error)
    end
  end
end
