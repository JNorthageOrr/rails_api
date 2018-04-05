require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    #enable CORS for React front end app:
    Rails.application.config.middleware.insert_before 0, Rack::Cors do
    	allow do
    		origins 'localhost:5000'
    		resource '*',
    		headers: :any,
    		methods: %i(get post options head)
    	end
    end

    # old CORS config
    #config.action_dispatch.default_headers = {
    #	'Access-Control-Allow-Origin' => 'http://localhost:5000',
    # 	'Access-Control-Request-Method' => %w{GET POST OPTIONS}.join(",")
    #}

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
