require 'securerandom'

require 'fileutils'
require 'sox'
require 'thor'

require 'serinette/cli'

require 'serinette/utils'
require 'serinette/mixins'
require 'serinette/music'

require 'serinette/effect'

require 'serinette/noise'

require 'serinette/song'
require 'serinette/track'

# Contains functions for running essential commands and
# defining app level constants
module Serinette
  OUTPUT_FILE_NAME = 'output'
  TMP_DIR = './tmp/'
  SOUND_FILE_TYPE = '.wav'

  # Primary function for creating and outputing new songs
  def self.orchestrate
    prepare
    Song.new
  end

  # Returns pull path of output file from project root
  def self.output_path
    Serinette::TMP_DIR +
      Serinette::OUTPUT_FILE_NAME +
      Serinette::SOUND_FILE_TYPE
  end

  # Basic Serinette error:
  class Error < StandardError; end

  private

  # Prepares for the orchestrate command
  def self.prepare
    clean
  end

  # Removes all files in TMP_DIR of type SOUND_FILE_TYPE
  def self.clean
    FileUtils.rm_rf(Dir.glob("#{TMP_DIR}*#{SOUND_FILE_TYPE}"))
  end
end
