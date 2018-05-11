# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SettingsUtility do
  describe '.site_url' do
    let(:actual) { SettingsUtility.site_url }
    let(:result) { 'localhost' }

    it { expect(actual).to eq(result) }
  end

  describe '.site_allowed' do
    let(:actual) { SettingsUtility.site_allowed }
    let(:url) { '/robots.txt' }

    it { expect(actual.include?(url)).to be_truthy }
  end

  describe '.site_disallowed' do
    let(:actual) { SettingsUtility.site_disallowed }
    let(:url) { '/admin' }

    it { expect(actual.include?(url)).to be_truthy }
  end
end
