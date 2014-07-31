require "rails-env-favicon/version"
require "rails-env-favicon/rails"

module RailsEnvFavicon
  def self.applicable?
    !::Rails.env.production?
  end
end
