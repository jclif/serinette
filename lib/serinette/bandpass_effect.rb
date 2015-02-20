# Compand type of effect
class BandpassEffect < Effect
  ROOT_COMMAND = 'bandpass'.freeze

  # Sox options:
  # -w|--wet-only [on - off]
  # reverberance (50%) [0 - 100]
  # HF-damping (50%) [0 - 100]
  # room-scale (100%) [0 - 100]
  # stereo-depth (100%) [0 - 100]
  # pre-delay (0ms) [0] TODO dtermine max pre-delay
  # wet-gain (0dB) [-10 - 10] TODO dB range
  SOX_OPTIONS_CONFIG = []
end