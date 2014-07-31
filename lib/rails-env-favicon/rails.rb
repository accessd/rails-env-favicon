require 'rails-env-favicon/middleware'

module RailsEnvFavicon
  module Rails
    class Engine < ::Rails::Engine
      initializer "rails_env_favicon.insert_middleware" do |app|
        if RailsEnvFavicon.applicable?
          app.config.middleware.use "RailsEnvFavicon::Middleware"
        end
      end
    end
  end
end
