# frozen_string_literal: true

require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
require 'action_cable/engine'
# require "sprockets/railtie"
require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RealEstateApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
    use Rack::Cors do
      allow do
        origins '*'
        # regular expressions can be used here

        resource '/file/list_all/', headers: 'x-domain-token'
        resource '/file/at/*',
                 methods: %i[get post delete put patch options head],
                 headers: 'x-domain-token',
                 expose: ['Some-Custom-Response-Header'],
                 max_age: 600
        # headers to expose
      end

      allow do
        origins '*'
        resource '/public/*', headers: :any, methods: :get

        # Only allow a request for a specific host
        resource '/api/v1/*',
                 headers: :any,
                 methods: :get,
                 if: proc { |env| env['HTTP_HOST'] == 'api.example.com' }
      end
    end
  end
end
