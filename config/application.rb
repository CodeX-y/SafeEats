require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module RailsTemplate
  class Application < Rails::Application
    config.load_defaults 7.0
    config.autoload_lib(ignore: %w(assets tasks))

    config.generators do |g|
      g.test_framework nil
      g.factory_bot false
      g.scaffold_stylesheet false
      g.stylesheets false
      g.javascripts false
      g.helper false
    end

    config.action_controller.default_protect_from_forgery = false
    config.generators.system_tests = nil
  end
end
