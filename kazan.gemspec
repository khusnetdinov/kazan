# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kazan/version'
require 'date'

Gem::Specification.new do |spec|
  spec.version = Kazan::VERSION

  spec.name = 'kazan'

  spec.authors = ['Marat Khusnetdinov']
  spec.email = ['marat@khusnetdinov.ru']
  spec.homepage = 'https://github.com/khusnetdinov/kazan'
  spec.license = 'MIT'

  spec.summary = 'Kazan creates rails project and setups predefined gems and tools.'
  spec.description = 'Kazan creates rails project and setups predefined gems and tools.'
  spec.rdoc_options = ['--charset=UTF-8']
  spec.extra_rdoc_files = %w[README.md LICENSE]

  spec.files = `git ls-files`.split("\n")
  spec.executables = ['kazan']
  spec.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")

  spec.add_dependency 'rails', '7.0.0', Kazan::RAILS_VERSION
  spec.add_dependency 'rails-i18n', Kazan::RAILS_I18N_VERSION

  spec.add_development_dependency 'rake', '~> 12.3.3'
  spec.add_development_dependency 'rspec', '~> 3.5'
end
