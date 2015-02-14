require 'fileutils'
require 'byebug'
require 'sox'

require 'mixins/descendents'

require 'serinette/effect'
require 'serinette/reverb_effect'
require 'serinette/noise'
require 'serinette/song'
require 'serinette/track'

module Serinette

  OUTPUT_FILE_NAME = 'tmp/output.wav'
  TMP_DIR = "./tmp/"
  SOUND_FILE_TYPE = '.wav'

  def self.clean
    # Removes all files in TMP_DIR of type SOUND_FILE_TYPE
    FileUtils.rm_rf(Dir.glob("#{TMP_DIR}*.wav"))
  end

  def self.orchestrate
  # Adds two numbers together, returning their sum.
  #
  # @param one [Fixnum] First number to add
  # @param two [Fixnum] Second number to add
  # @return [Fixnum] Sum of the two arguments
    clean

    sox = Sox::Cmd.new(:combine => :mix)

    song = Song.new
    song.configure_command(sox)

    sox.run
  end

end
