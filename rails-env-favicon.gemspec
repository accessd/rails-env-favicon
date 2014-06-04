# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails-env-favicon/version'

Gem::Specification.new do |spec|
  spec.name          = "rails-env-favicon"
  spec.version       = RailsEnvFavicon::VERSION
  spec.authors       = ["Accessd"]
  spec.email         = ["accessd0@gmail.com"]
  spec.summary       = %q{Gem to display the rails environment(except production) on the favicon}
  spec.description   = %q{Gem use Tinycon to manipulate with favicon}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "railties", ">= 3.1"
  spec.add_dependency "tinycon-rails"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
