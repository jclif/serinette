$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'serinette/version'

Gem::Specification.new do |g|
  g.name          = 'serinette'
  g.version       = Serinette::VERSION
  g.summary       = 'Random music from the command line.'
  g.description   = <<-DESC
    Serinette is a library with a strongly opionated approach to generating
    random music from the command line.
  DESC
  g.authors       = ['Jared Clifton', 'Austin Gatlin']
  g.email         = 'jaredcraigclifton@gmail.com'
  g.files         = `git ls-files`.split("\n")
  g.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  g.executables   = `git ls-files -- bin/*`.split("\n").map do |f|
    File.basename(f)
  end
  g.require_paths = ['lib']
  g.homepage      = 'http://jclif.github.io/serinette/'
  g.license       = 'MIT'

  g.required_ruby_version = '>= 1.9.3'

  g.add_dependency 'cliver', '0.3.2'
  g.add_dependency 'ruby-sox', '0.0.3'
  g.add_dependency 'rake', '10.4.2'
  g.add_dependency 'rspec', '3.2.0'
end
