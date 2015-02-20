# Provides Sox helper functions
module SoxWrapper
  # Takes options, generates a configured Sox::Cmd, and runs
  #
  # @params [Hash] options hash
  # @returns [Sox::Cmd] Sox command with all configurations
  def self.generate_and_run(options = {})
    setup(options, true)
  end

  # Takes options and generates a configured Sox::Cmd
  #
  # @params [Hash] options hash
  # @returns [Sox::Cmd] Sox commands with all configurations
  def self.generate(options = {})
    setup(options, false)
  end

  private

  # Internal function for setting up and running (if should_run) sox command
  def self.setup(options, should_run)
    options[:global_options] ||= {}
    options[:input] ||= '-n'
    options[:output] ||= '-n'
    options[:effects] ||= {}

    options[:effects].merge! Song::default_effects

    sox = Sox::Cmd.new options[:global_options]

    sox.add_input(options[:input])
    sox.set_effects(options[:effects])
    sox.set_output(options[:output])

    sox.run if should_run
    sox
  end
end
