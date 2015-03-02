module Serinette
  module Utils
    class FileName
      def self.generate
        "#{Serinette::TMP_DIR}#{SecureRandom.uuid}#{Serinette::SOUND_FILE_TYPE}"
      end
    end
  end
end
