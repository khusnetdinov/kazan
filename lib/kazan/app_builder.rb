module Kazan
  class AppBuilder < Rails::AppBuilder
    include Kazan::Actions

  end
end
