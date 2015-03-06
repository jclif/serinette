module Serinette
  class CLI < ::Thor
    desc 'orchestrate', 'Creates a random song'
    def generate
      Serinette.orchestrate
    end
  end
end
