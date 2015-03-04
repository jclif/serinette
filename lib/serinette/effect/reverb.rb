module Serinette
  module Effect
    class Reverb
      ROOT_COMMAND = 'reverb'.freeze

      # Sox options:
      # -w|--wet-only [on - off]
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
          value: (0..100),
          default: 50
        }, {
          type: :trait,
          name: 'HF-damping',
          value: (0..100),
          default: 50
        }, {
          type: :trait,
          name: 'room-scale',
          value: (0..100),
          default: 100
        }, {
          type: :trait,
          name: 'stereo-depth',
          value: (0..100),
          default: 100
        }, {
          type: :trait,
          name: 'pre-delay',
          value: (0..5),
          default: 0
        }, {
          type: :trait,
          name: 'wet-gain',
          value: (-10..10),
          default: 0
        }
      ]

      # Passes in the Effect Subclasses config to generate sox option hash
      #
      # @return [String] Result of randomized string representation of options
      def generate_options
        Mixins::SoxOptions.randomize_options_as_string(SOX_OPTIONS_CONFIG)
      end
      # Sox command
      def return_root_command
        ROOT_COMMAND
      end
    end
  end
end
