# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Web::SeoController, type: :routing do
  describe '#robots' do
    subject { get robots_path }

    it { is_expected.to be_routable }
    it { is_expected.to route_to(controller: 'web/seo', action: 'robots') }
  end

  describe '#sitemap' do
    subject { get sitemap_path }

    it { is_expected.to be_routable }
    it { is_expected.to route_to(controller: 'web/seo', action: 'sitemap', format: 'xml') }
  end
end
