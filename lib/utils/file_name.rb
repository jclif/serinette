module FileName
  def self.generate
    "#{TMP_DIR}#{SecureRandom.uuid}#{SOUND_FILE_TYPE}"
  end
end
