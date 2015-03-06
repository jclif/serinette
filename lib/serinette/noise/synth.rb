module Serinette
  module Noise
    # Synthesized Noises; using arguments such as type (sin, square, saw) and
    # will describe a subclass of Noises which corresponds to the use of the
    # synth sox command
    class Synth
      ROOT_COMMAND = 'synth'.freeze

      attr_accessor :wavefile

      # Sox options:
      # len (0) [0 - 10] length in seconds TODO: determine resonable range
      # type (sine) [sine, square, triangle, sawtooth, trapezium, exp,
      #   [white]noise, tpdfnoise pinknoise, brownnoise, pluck]
      # combine (create) [create, mix, amod (amplitude modulation), fmod
      #   (frequency modulation)]
      # freq/freq2 (A4) [A0-G9:A0-G9] TODO: expand stringify_options to allow
      #   for swept or fixed frequencies; perhaps a lambda to generate both
      #   thoughts: the freq can be given as a single note (fixed), or two
      #   (swept);if swept notes are chosen, one of the following separators
      #   must be used:
      #   ':' (linear) the tone will change by a set number of hertz per second
      #   '+' (square) a second-order function is used to change the tone
      #   '/' (exp) the tone will change by a set number of semitones per second
      #   '-' (exp) as '/', but initial phase always zero, and stepped (rougher)
      #     frequency changes
      #
      SOX_OPTIONS_CONFIG = [
        {
          type: :trait,
          name: 'length',
          value: (1..5), # cannot be zero, or will run indefinitely
          default: 1
        }, {
          type: :trait,
          name: 'type',
          value: %w(sine square triangle sawtooth trapezium exp),
          default: 'sine'
        }, {
          type: :trait,
          name: 'combine',
          value: %w(create mix amod fmod),
          default: 'create'
        }, {
          type: :trait,
          name: 'freq',
          value: proc do
            freq = Music.random_note
            if [true, false].sample
              freq << %w(: + / -).sample
              freq << Music.random_note
            end
            freq
          end,
          default: 'A4'
        }
      ]

      def initialize
        init_noise
        apply_effects
      end

      # Initialize a noise
      def init_noise
        os = Mixins::SoxOptions.randomize_options_as_string(SOX_OPTIONS_CONFIG)
        options = {
          output: Utils::FileName.generate,
          effects: { ROOT_COMMAND => os },
          run: true
        }

        Utils::SoxWrapper.generate options

        @wavefile = options[:output]
      end

      # TODO: implement effects for synth noises
      def apply_effects
      end
    end
  end
end
