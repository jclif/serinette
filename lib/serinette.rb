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

  def self.clean
    FileUtils.rm_rf(Dir.glob("#{TMP_DIR}*.wav"))
  end

  def self.orchestrate
    clean

    sox = Sox::Cmd.new(:combine => :mix)

    song = Song.new
    song.configure_command(sox)

    sox.run
  end

end
