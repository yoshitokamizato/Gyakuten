require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module ErrorCollection
  class Application < Rails::Application
    config.load_defaults 5.2
    config.time_zone = 'Tokyo'
    config.i18n.default_locale = :ja
  end
end
