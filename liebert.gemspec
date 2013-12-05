# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'liebert/version'

Gem::Specification.new do |spec|
  spec.name          = 'liebert'
  spec.version       = Liebert::VERSION
  spec.authors       = ['Brooks Swinnerton']
  spec.email         = ['bswinnerton@gmail.com']
  spec.description   = %q{A gem to gather metrics from Liebert products with a web interface}
  spec.summary       = %q{A gem to gather metrics from Liebert products with a web interface}
  spec.homepage      = 'https://github.com/bswinnerton/liebert'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'webmock', '~> 1.15.0'
  spec.add_development_dependency 'vcr'

  spec.add_runtime_dependency 'rest-client'
  spec.add_runtime_dependency 'nokogiri'
end
