# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'emergency_number/version'

Gem::Specification.new do |spec|
  spec.name          = 'emergency_number'
  spec.version       = EmergencyNumber::VERSION
  spec.authors       = ['Shayon Mukherjee']
  spec.email         = ['dev@shayon.me']

  spec.summary       = 'Get any emergency numbers for any country in the world'
  spec.description   = 'Based on Emergency Number API. This ruby gem allows you to query the API and get any emergency numbers for any country in the world.'
  spec.homepage      = 'https://github.com/shayonj/emergency_number'

  spec.files         = `git ls-files -z`.split('\x0').reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'

  spec.files         = `git ls-files -z`.split('\x0').reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.platform      = Gem::Platform::RUBY

  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
