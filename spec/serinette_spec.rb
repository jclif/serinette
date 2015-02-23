require 'spec_helper'

describe Serinette do
  it 'should have a variable called OUTPUT_FILE_NAME' do
    expect(Serinette::OUTPUT_FILE_NAME).not_to be_nil
  end

  it 'should have a variable called TMP_DIR' do
    expect(Serinette::TMP_DIR).not_to be_nil
  end

  it 'should have a variable called SOUND_FILE_TYPE' do
    expect(Serinette::SOUND_FILE_TYPE).not_to be_nil
  end

  describe '.clean' do
    it 'should exist' do
      expect(Serinette).to respond_to(:clean)
    end

    it 'should remove all wav files from the tmp directory' do
      file_name = "#{Serinette::TMP_DIR}test.#{Serinette::SOUND_FILE_TYPE}"
      FileUtils.touch(file_name)
      Serinette.clean
      expect(File.exist?(file_name)).to be false
    end
  end

  describe '.output_path' do
    it 'should exist' do
      expect(Serinette).to respond_to(:output_path)
    end

    it 'should get output path' do
      path = Serinette::TMP_DIR +
             Serinette::OUTPUT_FILE_NAME +
             Serinette::SOUND_FILE_TYPE
      expect(Serinette.output_path).to eq path
    end
  end

  describe '.orchestrate' do
    it 'should exist' do
      expect(Serinette).to respond_to(:orchestrate)
    end

    it 'should output a file' do
      Serinette.orchestrate
      expect(File.exist?(Serinette.output_path)).to be true
    end
  end
end
