# frozen_string_literal: true

module Web
  # SeoController generate metadata for browsers and search engines:
  # robots.txt and site.xml
  class SeoController < ApplicationController
    before_action :cache, only: %i[robots sitemap]
    before_action :load_routes, only: %i[robots sitemap]

    def robots; end

    def sitemap
      respond_to do |format|
        format.xml
      end
    end

    private

    def cache
      expires_in 6.hours, public: true if Rails.env.production?
    end

    def load_routes
      @allowed_routes = SettingsUtility.site_allowed
      @disallow_routes = SettingsUtility.site_disallowed
      @base_url = SettingsUtility.site_url
    end
  end
end
