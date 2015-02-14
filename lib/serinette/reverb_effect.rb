# Reverb type of effect
class ReverbEffect < Effect
  ROOT_COMMAND = 'reverb'

  # Options include:
  # -w: wet only
  def generate_options
    '-w'
  end

  # Sox command
  def return_root_command
    ROOT_COMMAND
  end
end
