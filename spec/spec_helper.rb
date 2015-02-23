# require 'coveralls'
require 'codeclimate-test-reporter'

# Coveralls.wear!
CodeClimate::TestReporter.start

require 'serinette'

# Custom Matchers
Dir[File.expand_path(File.join(File.dirname(__FILE__),'support','**','*.rb'))].each {|f| require f}
