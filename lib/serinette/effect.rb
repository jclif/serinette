class Effect

  include Descendents

  def self.get_effects(num)
    Array.new(num).map do |el|
      el = Effect.descendents.sample.new
    end
  end

  def to_sox_key_pair
    return {get_root_command => get_options}
  end

end
