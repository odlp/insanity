# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'insanity/version'

Gem::Specification.new do |spec|
  spec.name          = "insanity"
  spec.version       = Insanity::VERSION
  spec.authors       = ["odlp"]
  spec.email         = ["oliverp@gmail.com"]

  spec.summary       = "Summary"
  spec.description   = "Description"
  spec.homepage      = ""

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "aruba", "~> 0.14"
  spec.add_development_dependency "cucumber", "~> 2.3", ">= 2.3.3"
end
