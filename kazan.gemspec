# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kazan/version'
require 'date'

Gem::Specification.new do |spec|
  spec.version = Kazan::VERSION
  spec.required_ruby_version = Kazan::RUBY_PROJECT_VERSION

  spec.name = 'kazan'

  spec.authors = ['Marat Khusnetdinov']
  spec.email = ['marat@khusnetdinov.ru']
  spec.homepage = 'https://github.com/khusnetdinov/kazan'
  spec.license = 'MIT'

  spec.summary = %q{Kazan creates rails project and setups predefined gems and tools.}
  spec.description = %q{Kazan creates rails project and setups predefined gems and tools.}
  spec.rdoc_options = ['--charset=UTF-8']
  spec.extra_rdoc_files = %w[README.md LICENSE]

  spec.files = `git ls-files`.split("\n")
  spec.executables = ['kazan']
  spec.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")

  spec.add_dependency 'rails', Kazan::RAILS_VERSION
  spec.add_dependency 'bundler', '~> 1.3'

  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.5'
end
