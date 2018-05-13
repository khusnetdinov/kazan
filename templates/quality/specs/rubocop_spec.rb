# frozen_string_literal: true

require 'json'

RSpec.describe 'RubocopEnsurance' do
  it 'does not have rubocop offenses' do
    command = 'bin/rubocop --config ./.quality/.rubocop.yml'
    result = `#{command} --format json`
    warnings = JSON.parse(result)['summary']['offense_count']
    message = "Rubocop #{warnings} warning, run '#{command}' to show them"

    expect(warnings).to eq(0), message
  end
end
