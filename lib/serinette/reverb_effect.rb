class ReverbEffect < Effect
  ROOT_COMMAND = 'reverb'

  def get_options
    return '-w'
  end

  def get_root_command
    return ROOT_COMMAND
  end

end
