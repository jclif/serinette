class ReverbEffect < Effect
  ROOT_COMMAND = 'reverb'

  def get_options
    return true
  end

  def get_root_command
    return ROOT_COMMAND
  end

end
