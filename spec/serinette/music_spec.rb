require 'spec_helper'

describe Serinette::Music do
  context 'a class method #random_note' do
    it 'should exist' do
      expect(Serinette::Music).to respond_to(:random_note)
    end

    it 'should return a random note' do
      allow_any_instance_of(Array).to receive(:sample).and_return('A4')
      expect(Serinette::Music.random_note).to eq 'A4'
    end

  end
end
