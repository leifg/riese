# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'riese/version'

Gem::Specification.new do |gem|
  gem.name          = 'riese'
  gem.version       = Riese::VERSION
  gem.authors       = ['Leif Gensert']
  gem.email         = ['leifg@gmx.de']
  gem.description   = %q{This is a gem that provides basic arithmetic functioniality to fraction. It's more about showing certain principles of OOP than the functionality itself.}
  gem.summary       = %q{Arithmetic functions on Fractions}
  gem.homepage      = ''

  gem.add_development_dependency 'minitest'
  gem.add_development_dependency 'turn'
  gem.add_development_dependency 'guard'
  gem.add_development_dependency 'guard-minitest'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']
end
