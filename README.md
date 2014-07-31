Rails Env Favicon
================================

[![Gem Version](https://badge.fury.io/rb/rails-env-favicon.svg)](http://badge.fury.io/rb/rails-env-favicon)

Made changes in the code to debug and do not understand what's wrong. 
Hell, I'm on the debug production! This happened to you? To me several times.
Library offers one of the ways to solve this problem.

Most everyone will understand from one picture:

![ScreenShot](https://raw.github.com/accessd/rails-env-favicon/master/doc/img/sample.png)

This means that on the first tab we have development environment, on second stage, and third it's production(we don't need change this favicon).

It uses [Tinycon](https://github.com/tommoor/tinycon) - A small library for manipulating the favicon.

And one more option:

![ScreenShot](https://raw.github.com/accessd/rails-env-favicon/master/doc/img/sample-grayscale.png)

Icon will be gray on non production environment.

__Js usage for this task justified by the fact that more often than not have to worry about favicon caching, because favicon changes on the fly after it's loaded. However, if you do not like to use js for this problem, you may use alternative version of gem which uses https://github.com/rmagick/rmagick, follow to branch [rmagick](https://github.com/accessd/rails-env-favicon/tree/rmagick)__

Installation
------------

Add this line to your application's Gemfile:

    gem 'rails-env-favicon'

And then execute:

    $ bundle

Setup:

    # adds initializer
    rails g rails_env_favicon:install

In your JavaScript manifest (e.g. `application.js`):

    //= require rails_env_favicon

Config
------------

In config/initializers/rails_env_favicon.rb

    RailsEnvFavicon.setup do |config|
      # If true then favicon will be gray on non production env
      config.make_grayscale = false
      # or if make_grayscale = false then draw badge on favicon with this options:
      config.text_color = '#ffffff'
      config.background_color = '#549a2f'
    end

You can also configure the condition of changing favicon and badge label, just override `RailsEnvFavicon` module methods. For example:

    module RailsEnvFavicon
      def self.badge_label
        ENV['TEATRO'].present? ? 'T' : ::Rails.env.first.upcase
      end

      def self.applicable?
        !::Rails.env.production? || ENV['TEATRO'].present?
      end
    end

Issues
-------------

  * If you change a configuration to apply changes, you have to:

    * Execute `rm -rf tmp/cache/*` in app directory, for assets cache cleaning.
    * Restart web server.

Contributing
-------------

1. Fork it ( http://github.com/[my-github-username]/rails_env_favicon/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
