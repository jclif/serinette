# require 'coveralls'
require 'codeclimate-test-reporter'

# Coveralls.wear!
CodeClimate::TestReporter.start

require 'serinette'

# Custom Matchers
d = File.expand_path(File.join(File.dirname(__FILE__), 'support', '**', '*.rb'))
Dir[d].each { |f| require f }
