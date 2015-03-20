require_relative 'music/theory'
require_relative 'music/melody'

module Serinette
  module Music
    def self.random_note(options = {})
      if options[:notation] && options[:notation] == :scientific
        return random_scientific_notation
      else
        random_root
      end
    end

    private

    # Returns random note in scientific notation
    def self.random_scientific_notation
      ('A'..'G').to_a.product((0..9).to_a).map { |el| el.join('') }.sample
    end

    # Returns random note
    def self.random_root
      ('A'..'G').sample
    end
  end
end
