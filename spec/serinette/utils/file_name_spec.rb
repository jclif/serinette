require 'spec_helper'

describe Serinette::FileName do
  context 'a class method #generate' do
    it 'should exist' do
      expect(Serinette::FileName).to respond_to(:generate)
    end

    it 'should return a string' do
      expect(Serinette::FileName.generate).to be_a String
    end

    it 'should be random'

  end
end
