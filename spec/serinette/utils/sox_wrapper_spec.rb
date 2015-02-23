require 'spec_helper'

describe Serinette::SoxWrapper do
  context 'a class method #generate' do
    it 'should exist' do
      expect(Serinette::SoxWrapper).to respond_to(:generate)
    end

    it 'should return a Sox::Cmd' do
      expect(Serinette::SoxWrapper.generate).to be_a Sox::Cmd
    end

    it 'should configure the Sox::Cmd correctly'
  end
end
