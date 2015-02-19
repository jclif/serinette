# Synthesized Noises; using arguments such as type (sin, square, saw) and will
# describe a subclass of Noises which corresponds to the use of the synth
# sox command
class SynthNoise < Noise
  ROOT_COMMAND = 'synth'.freeze

  # Sox options:
  # -j KEY TODO figure out what this does; leave out for now
  #   docs: the -j KEY option selects 'just intonation', where Key is an
  #   integer number of semi-tones relative to A (so for ex, -9 or 3 selects the
  #   key of C), or a note in scientific notation
  # len (0) [0 - 10] length in seconds TODO determine resonable range
  # type (sine) [sine, square, triangle, sawtooth, trapezium, exp,
  #   [white]noise, tpdfnoise pinknoise, brownnoise, pluck]
  #   TODO add condition support in SoxOptions, such that the 'noise' type
  #   synths can be chosen, and force some state in another option (noises cant
  #   be swept, so freq/freq2 could not include two values)
  # combine (create) [create, mix, amod (amplitude modulation), fmod
  #   (frequency modulation)]
  # freq/freq2 (A4) [A0-G9:A0-G9] TODO expand stringify_options to allow for
  #   swept or fixed frequencies; perhaps a lambda to generate both
  #   thoughts: the freq can be given as a single note (fixed), or two (swept);
  #   if swept notes are chosen, one of the following separators must be used:
  #   ':' (linear) the tone will change by a fixed number of hertz per second
  #   '+' (square) a second-order function is used to change the tone
  #   '/' (exp) the tone will change by a fixed number of semitones per second
  #   '-' (exp) link '/', but initial phase always zero, and stepped (rougher)
  #     frequency changes
  # off TODO figure out what this does; leave out for now
  # ph TODO figure out what this does; leave out for now
  # p1 TODO figure out what this does; leave out for now
  # p2 TODO figure out what this does; leave out for now
  # p3 TODO figure out what this does; leave out for now
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
      value: Proc.new do
        freq = ('A'..'G').to_a.product((0..9).to_a).map { |el| el.join('') }.sample
        if [true, false].sample
          freq << [':','+','/','-'].sample
          freq << ('A'..'G').to_a.product((0..9).to_a).map { |el| el.join('') }.sample
        end
        freq
      end,
      default: 'A4'
    }
  ]

  def initialize
    init_effects
    generate_noise
    apply_effects
  end

  def generate_noise
    output = FileName::generate
    sox = Sox::Cmd.new
    sox.add_input('-n')
    sox.set_output(output)
    synth_string = SoxOptions::randomize_options_as_string(SOX_OPTIONS_CONFIG)
    effects = Song.default_effects
    effects.merge!(ROOT_COMMAND => synth_string)
    sox.set_effects(effects)
    sox.run
    @wavefile = output
  end

  def init_effects
    # TODO
  end

  def apply_effects
    # TODO
  end
end
