# frozen_string_literal: true

require 'json'
require 'yaml'

RSpec.describe 'BrakemanEnsurance' do
  let(:settings) do
    YAML.safe_load(File.read(File.expand_path('../../.quality/.quality.yml', __FILE__)))
  end

  let(:obsoletes) do
    settings['quality']['brakeman']['obsolete']['max'].to_i
  end

  let(:stamps) do
    settings['quality']['brakeman']['obsolete']['stamps']
  end

  let(:command) do
    'bin/brakeman --ignore-config ./.quality/.brakeman.ignore --config ./.quality/.brakeman.yml '
  end

  let(:result) { `#{command} --format json --quiet` }

  it 'does not have brakeman warnings' do
    warnings = JSON.parse(result)['warnings'].size
    message = "Brakeman #{warnings} warnings, run '#{command}' to show them"

    expect(warnings).to eq(0), message
  end

  it 'does not have brakeman errors' do
    errors = JSON.parse(result)['errors'].size
    message = "Brakeman #{errors} errors, run '#{command}' to show them"

    expect(errors).to eq(0), message
  end

  it 'does not have brakeman obsolete' do
    obsolete = JSON.parse(result)['obsolete']
    message = "Brakeman #{obsolete.size} obsolete, run '#{command}' to show them"

    expect(obsolete.size).to eq(obsoletes), message
    expect(obsolete).to eq(stamps), message
  end

  it 'does not have brakeman security warnings' do
    warnings = JSON.parse(result)['scan_info']['security_warnings']
    message = "Brakeman #{warnings} security warnings, run '#{command}' to show them"

    expect(warnings).to eq(0), message
  end
end
