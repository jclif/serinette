require_relative 'music/theory'
require_relative 'music/melody'

module Serinette
  module Music
    # Returns random note in scientific notation
    def self.random_note
      ('A'..'G').to_a.product((0..9).to_a).map { |el| el.join('') }.sample
    end
  end
end
