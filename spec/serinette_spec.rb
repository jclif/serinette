require 'spec_helper'

describe Serinette do

  it 'should have a variable called OUTPUT_FILE_NAME' do
    expect(Serinette::OUTPUT_FILE_NAME).not_to be_nil
  end

  context "a class method #clean" do
    it "should exist" do
      Serinette.should respond_to :clean
    end

    it "should remove all wav files from the tmp directory" do
      file_name = "#{Serinette::TMP_DIR}test.wav"
      FileUtils.touch(file_name)
      Serinette.clean
      expect(File.exists?(file_name)).to be false
    end
  end

  context "a class method #orchestrate" do
    it "should exist" do
      Serinette.should respond_to :orchestrate
    end

    it "should output a file" do
      Serinette.orchestrate
      expect(File.exist?(Song::OUTPUT_FILE_NAME)).to be true
    end
  end



end
