require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LCAPtool
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.assets.precompile << /\.(?:svg|eot|woff|ttf)\z/
    # precompile vendor assets
    config.assets.precompile += ['active_admin.css']
    config.assets.precompile += %w( base.js )
    config.assets.precompile += %w( base.css )
    #controller css assets
    config.assets.precompile += [

                                 'dashboard.css',
                                 'ui.css',
                                 'forms.css',
                                 'tables.css',
                                 'charts.css',
                                 'mail.css',
                                 'maps.css'

                                ]
    #controller js assets
    config.assets.precompile += [

                                 'dashboard.js',
                                 'ui.js',
                                 'forms.js',
                                 'tables.js',
                                 'charts.js',
                                 'mail.js',
                                 'maps.js'

                                ]


    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
