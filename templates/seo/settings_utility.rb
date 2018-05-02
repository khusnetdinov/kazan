# frozen_string_literal: true

# Utility for working with Settings keep all logic here with reek disabled warnings
module SettingsUtility
  module_function

  def site_url
    Settings.site_url
  end

  def site_allowed
    Settings.seo.allowed
  end

  def site_disallowed
    Settings.seo.disallow
  end
end
