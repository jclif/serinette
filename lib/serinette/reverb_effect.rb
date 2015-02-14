# Reverb type of effect
class ReverbEffect < Effect
  ROOT_COMMAND = 'reverb'

  def generate_options
    '-w'
  end

  def return_root_command
    ROOT_COMMAND
  end
end
