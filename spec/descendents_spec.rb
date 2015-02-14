require 'spec_helper'

describe Descendents do
  let(:klass) { Class.new { include Descendents } }

  context 'a class method #descendents' do
    it 'should exist in classes which include the module' do
      klass.should respond_to :descendents
    end

    it 'should return a classes descendents' do
      class Subklass1 < klass; end
      class Subklass2 < klass; end
      expect(klass.descendents - [Subklass1, Subklass2]).to eq []
    end
  end
end
