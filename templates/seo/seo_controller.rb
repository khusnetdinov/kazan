# frozen_string_literal: true

module Web
  # SeoController generate metadata for browsers and search engines:
  # robots.txt and site.xml
  class SeoController < ApplicationController
    before_action :cache, only: %i[robots sitemap]
    before_action :load_routes, only: %i[robots sitemap]

    def robots
      @base_url = site_url
    end

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
    end

    # :reek:UtilityFunction
    def site_url
      SettingsUtility.site_url
    end
    helper_method :site_url
  end
end
