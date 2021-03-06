require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Monolith
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Include component code
    Dir['components/*'].each do |path|
      config.paths['app']                 << "#{path}/app"
      config.paths['app/views']           << "#{path}/app/views"
      config.paths['config/initializers'] << "#{path}/config/initializers"
      config.paths['db']                  << "#{path}/db"
      config.paths['db/migrate']          << "#{path}/db/migrate"
      config.paths['lib']                 << "#{path}/lib"

      config.factory_bot.definition_file_paths << "#{path}/spec/factories"
    end

    # Autoload constants from lib
    config.autoload_paths += [
      "#{config.root}/lib"
    ]
  end
end
