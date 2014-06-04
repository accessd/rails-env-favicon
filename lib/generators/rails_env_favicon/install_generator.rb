module RailsEnvFavicon
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      desc "creates an initializer file at config/initializers/rails_env_favicon.rb"
      source_root File.expand_path('../../../..', __FILE__)

      def generate_initialization
        copy_file 'config/initializers/rails_env_favicon.rb', 'config/initializers/rails_env_favicon.rb'
      end
    end
  end
end
