module Serinette
  module Utils
    # Utility class for interacting with sound files
    class FileName
      # Generates a path within tmp dir with random uuid and sound file type
      def self.generate
        "#{Serinette::TMP_DIR}#{SecureRandom.uuid}#{Serinette::SOUND_FILE_TYPE}"
      end
    end
  end
end
