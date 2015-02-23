$:.push File.expand_path("../lib", __FILE__)
require "serinette/version"

Gem::Specification.new do |gem|
  gem.name          = 'serinette'
  gem.version       = Serinette::VERSION
  gem.summary       = "Random music from the command line."
  gem.description   = "Serinette is a library with a strongly opionated approach to generating random music from the command line."
  gem.authors       = ['Jared Clifton', 'Austin Gatlin']
  gem.email         = 'jaredcraigclifton@gmail.com'
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.require_paths = ['lib']
  gem.homepage      = 'http://jclif.github.io/serinette/'
  gem.license       = 'MIT'

  gem.required_ruby_version = '>= 1.9.3'

  gem.add_dependency 'cliver', '0.3.2'
  gem.add_dependency 'ruby-sox', '0.0.3'
  gem.add_dependency 'rake', '10.4.2'
  gem.add_dependency 'rspec', '3.2.0'
end
