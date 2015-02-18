# Gives mixed in classes a method for randomizing effect options
module SoxOptions
  # Takes a sox effect config and returns randomized Hash.
  #
  # @param config [Array] Sox effect options config
  #
  # @return [string] Randomized effect hash to be used with Sox::Cmd.set_effects
  def self.randomize_options_as_string(configs)
    configs.map do |o|
      stringify_option(o)
    end.compact.join(' ')
  end

  # Takes an individual option and checks for type, (if flag, its either on of
  # off; if traig, randomize within the range given
  #
  # @param option [Option] Sox effect option
  # Looks like this:
  #   {
  #     type: :flag,
  #     name: 'wet-only',
  #     value: '-w'
  #   }
  # or this:
  #   {
  #     type: :trait,
  #     name: 'reverberance',
  #     range: (0..100), <== this can be an array or range, and it should sample
  #     default: 50
  #   {
  #
  # @return [string] Randomized effect hash to be used with Sox::Cmd.set_effects
  def self.stringify_option(option)
    case option[:type]
    when :flag
      return [true, false].sample ? option[:value] : nil
    when :trait # TODO add check for proc here
      return process_trait(option[:value])
    else
      fail Serinette::Error, '#stringify_option requires type of flag or trait'
    end
  end

  def self.process_trait(trait)
    case trait
    when Range
      return trait.to_a.sample
    when Array
      return trait.sample
    when Proc
      return trait.call
    else
      msg = '#process_trait requires trait of type Array, Range, or Proc'
      fail Serinette::Error, msg
    end
  end
end
