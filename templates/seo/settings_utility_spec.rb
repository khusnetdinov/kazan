# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SettingsUtility do
  describe '.site_url' do
    let(:actual) { SettingsUtility.site_url }
    let(:result) { 'localhost' }

    it { expect(actual).to eq(result) }
  end

  describe '.site_allowed' do
    let(:actual) { SettingsUtility.site_allowed.include?('/robots.txt') }

    it { expect(actual).to be_truthy }
  end

  describe '.site_disallowed' do
    let(:actual) { SettingsUtility.site_disallowed }

    it { expect(actual).to be_falsey }
  end
end
