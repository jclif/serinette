require 'spec_helper'

describe Serinette::Utils::FileName do
  context 'a class method #generate' do
    it 'should exist' do
      expect(Serinette::Utils::FileName).to respond_to(:generate)
    end

    it 'should return a string' do
      expect(Serinette::Utils::FileName.generate).to be_a String
    end

    it 'should be random' do
      uuid = '43e0d941-2a5e-4a72-8067-165891a25108'
      allow(SecureRandom).to receive(:uuid).and_return(uuid)

      filename = Serinette::Utils::FileName.generate
      # TODO: how do you interpolate regex (for filename match)
      regex = /\/(?<uuid>[a-z0-9-]+)\.wav$/i
      match = filename.match(regex)

      expect(match['uuid']).to eq uuid
    end
  end
end
