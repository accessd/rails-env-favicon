require "rails-env-favicon/version"
require "rails-env-favicon/railtie" if defined? Rails

module RailsEnvFavicon
  mattr_accessor :text_color
  self.text_color = '#ffffff'
  mattr_accessor :background_color
  self.background_color = '#549a2f'

  def self.env_letter
    ::Rails.env.first.upcase
  end

  class << self
    def setup
      yield self
    end
  end
end
