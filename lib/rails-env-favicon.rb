require "rails-env-favicon/version"
require "rails-env-favicon/rails"

module RailsEnvFavicon
  mattr_accessor :text_color
  self.text_color = '#ffffff'
  mattr_accessor :background_color
  self.background_color = '#549a2f'

  mattr_accessor :make_grayscale
  self.make_grayscale = false

  def self.badge_label
    ::Rails.env.first.upcase
  end

  def self.applicable?
    !::Rails.env.production?
  end

  class << self
    def setup
      yield self
    end
  end
end
