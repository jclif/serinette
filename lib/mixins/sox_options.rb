# Gives mixed in classes a method for randomizing effect options
module SoxOptions
  # Takes a sox effect config and returns randomized Hash.
  #
  # @param config [Array] Sox effect options config
  #
  # @return [string] Randomized effect hash to be used with Sox::Cmd.set_effects
  def self.randomize_effect_options_as_string(configs)
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
  #     range: (0..100),
  #     default: 50
  #   {
  #
  # @return [string] Randomized effect hash to be used with Sox::Cmd.set_effects
  def self.stringify_option(option)
    case option[:type]
    when :flag
      return [true, false].sample ? option[:value] : nil
    when :trait
    else
      fail Serinette::Error, '#stringify_option requires type = flag/trait'
    end
  end
end
