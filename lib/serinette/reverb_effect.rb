# Reverb type of effect
class ReverbEffect < Effect
  ROOT_COMMAND = 'reverb'

  # Options include:
  # [-w|--wet-only] [on - off]
  # reverberance (50%) [0 - 100]
  # HF-damping (50%) [0 - 100]
  # room-scale (100%) [0 - 100]
  # stereo-depth (100%) [0 - 100]
  # pre-delay (0ms) [0] TODO dtermine max pre-delay
  # wet-gain (0dB) [-10 - 10] TODO dB range
  SOX_OPTIONS_CONFIG = [
    {
      type: :flag,
      name: 'wet-only',
      value: '-w'
    }, {
      type: :trait,
      name: 'reverberance',
      range: (0..100),
      default: 50
    }, {
      type: :trait,
      name: 'HF-damping',
      range: (0..100),
      default: 50
    }, {
      type: :trait,
      name: 'room-scale',
      range: (0..100),
      default: 100
    }, {
      type: :trait,
      name: 'stereo-depth',
      range: (0..100),
      default: 100
    }, {
      type: :trait,
      name: 'pre-delay',
      range: (0..5),
      default: 0
    }, {
      type: :trait,
      name: 'wet-gain',
      range: (-10..10),
      default: 0
    }
  ]

  # Passes in the Effect Subclasses config to generate sox option hash
  #
  # @return [Hash] Result of randomize_effect_options
  def generate_options
    SoxOptions.randomize_effect_options_as_string(SOX_OPTIONS_CONFIG)
  end
  # Sox command
  def return_root_command
    ROOT_COMMAND
  end
end
