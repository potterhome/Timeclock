# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'timeclock/version'

Gem::Specification.new do |spec|
  spec.name          = "timeclock"
  spec.version       = Timeclock::VERSION
  spec.authors       = ["Andrew Lemmons"]
  spec.email         = ["andrew@lemmonhead.com"]
  spec.description   = %q{Utility to track timeclock punching}
  spec.summary       = %q{Utility to track timeclock punching}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "activerecord", '~> 4.0.0'
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "formatador"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "thor"

  spec.add_dependency "activerecord", '~> 4.0.0'
  spec.add_dependency "formatador"
  spec.add_dependency "sqlite3"
  spec.add_dependency "thor"
end
