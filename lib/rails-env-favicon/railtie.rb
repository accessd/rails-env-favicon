require 'rails-env-favicon/middleware'

module RailsEnvFavicon
  class Railtie < Rails::Railtie
    initializer "rails_env_favicon.insert_middleware" do |app|
      app.config.middleware.use "RailsEnvFavicon::Middleware"
    end
  end
end
