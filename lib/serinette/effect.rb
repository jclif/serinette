# Used to get subclasses and generate sox commands
class Effect
  include Descendents
  include SoxOptions

  EXCLUDED_EFFECTS = []

  # registers a subclass within excluded effects
  #
  # @param klass [effect subclass] Subclass of effect
  # @return [nil]
  def self.register_exclusion(klass)
    EXCLUDED_EFFECTS << klass unless EXCLUDED_EFFECTS.include? klass
  end

  # Gets a specified number of Effect subclasses.
  #
  # @param num [Fixnum] Number of effects
  # @return [Array] An array of Effect subclasses
  def self.sample_effects_classes(num)
    Array.new(num).map do
      (Effect.descendents-EXCLUDED_EFFECTS).sample.new
    end
  end

  # Gets a key pair for a given sox effect and its args
  def to_sox_key_pair
    { return_root_command => generate_options }
  end
end