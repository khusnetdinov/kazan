# frozen_string_literal: true

RSpec.describe 'BundlerAuditEnsurance' do
  let(:success) { 'No vulnerabilities found' }

  it 'does not have vulnerability warnings' do
    command = 'bin/bundler-audit check'
    result = `#{command}`
    message = "Bundler Audit has warnings, run '#{command}' to show them"

    expect(result).to match(success), message
  end
end
