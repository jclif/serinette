require 'spec_helper'

describe FileName do
  context 'a class method #generate' do
    it 'should exist' do
      expect(FileName).to respond_to(:generate)
    end

    it 'should return a random string' do
      expect(FileName.generate).to be_a String
    end
  end
end
