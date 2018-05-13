# frozen_string_literal: true

require 'json'

RSpec.describe 'EslintEnsurance' do
  let(:command) do
    './node_modules/eslint/bin/eslint.js app/assets/javascripts -c ./.quality/.eslintrc.yml'
  end
  let(:result) { `#{command} --format json` }

  it 'does not have eslint warnings' do
    warnings = JSON.parse(result).first['warningCount']
    message = "Reek #{warnings} warnings, run '#{command}' to show them"

    expect(warnings).to eq(0), message
  end

  it 'does not have eslint errros' do
    errors = JSON.parse(result).first['errorCount']
    message = "Reek #{errors} errors, run '#{command}' to show them"

    expect(errors).to eq(0), message
  end
end
