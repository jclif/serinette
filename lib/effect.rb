require 'mixins/descendents'

class Effect

  include Descendents

  def self.get_effects(num)
    Effect.descendents.sample
  end

  def to_sox_key_pair
    return {get_root_command => get_options}
  end

end
