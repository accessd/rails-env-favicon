Rails Env Favicon (RMagick version)
================================

[![Gem Version](https://badge.fury.io/rb/rails-env-favicon.svg)](http://badge.fury.io/rb/rails-env-favicon)

Made changes in the code to debug and do not understand what's wrong. 
Hell, I'm on the debug production! This happened to you? To me several times.
Library offers one of the ways to solve this problem.

Most everyone will understand from one picture:

![ScreenShot](https://raw.github.com/accessd/rails-env-favicon/master/doc/img/sample-grayscale.png)

Icon will be gray on non production environment.

It depends on https://github.com/rmagick/rmagick

Installation
------------

Add this line to your application's Gemfile:

    gem 'rails-env-favicon', github: 'accessd/rails-env-favicon', branch: 'rmagick'

And then execute:

    $ bundle

Setup:

    # adds initializer
    rails g rails_env_favicon:install


Config
------------

You can configure the condition of changing favicon, just override RailsEnvFavicon module method. For example:

    RailsEnvFavicon
      def self.applicable?
        !::Rails.env.production? || ENV['TEATRO'].present?
      end
    end

Issues
-----------

* You may face a problem caching favicon by browser, in this case, I recommend search solution for a specific browser (In Chrome on Mac OS X you may to try to remove file with favicon cache `~/Library/Application Support/Google/Chrome/Default/Favicons` and restart browser).
