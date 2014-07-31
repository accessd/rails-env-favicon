# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails-env-favicon/version'

Gem::Specification.new do |spec|
  spec.name          = "rails-env-favicon"
  spec.version       = RailsEnvFavicon::VERSION
  spec.authors       = ["Accessd"]
  spec.email         = ["accessd0@gmail.com"]
  spec.summary       = %q{Gem to display the rails environment on the favicon}
  spec.description   = %q{Gem to display the rails environment on the favicon}
  spec.homepage      = "https://github.com/accessd/rails-env-favicon"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", ">= 3.0"
  spec.add_dependency "rmagick"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
