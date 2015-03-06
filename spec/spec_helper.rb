# require 'coveralls'
require 'codeclimate-test-reporter'

# Coveralls.wear!
CodeClimate::TestReporter.start

require 'serinette'

# Custom Matchers
d = File.expand_path(File.join(File.dirname(__FILE__), 'support', '**', '*.rb'))
Dir[d].each { |f| require f }

# Ensures that stdout is directed into dev/null.txt during tests
RSpec.configure do |config|
  original_stderr = $stderr
  original_stdout = $stdout

  config.before(:all) do
    dev = File.join(File.dirname(__FILE__), 'dev', 'log.txt')
    $stderr = File.new(dev, 'w')
    $stdout = File.new(dev, 'w')
  end

  config.after(:all) do
    $stderr = original_stderr
    $stdout = original_stdout
  end
end
