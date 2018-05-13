# frozen_string_literal: true

require 'json'

RSpec.describe 'ScssLintEnsurance' do
  it 'does not have scss-lint warnings' do
    command = 'bin/scss-lint --config ./.quality/.scss-lint.yml'
    result = `#{command} --format JSON`
    warnings = JSON.parse(result).keys.size
    message = "Scss Lint warnings in #{warnings} files, run '#{command}' to show them"

    expect(warnings).to eq(0), message
  end
end
