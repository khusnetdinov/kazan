# frozen_string_literal: true

require 'json'

RSpec.describe 'HamlLintEnsurance' do
  it 'does not have haml-lint warnings' do
    path = 'app/views/**/*.haml'
    command = "bin/haml-lint #{path} --config ./.quality/.haml-lint.yml"
    result = `#{command} --reporter JSON`
    warnings = JSON.parse(result)['summary']['offense_count']
    message = "Haml Lint #{warnings} warnings, run '#{command}' to show them"

    expect(warnings).to eq(0), message
  end
end
