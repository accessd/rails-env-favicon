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
      config.text_color = '#ffffff'
      config.background_color = '#549a2f'
    end
    
    
TODO
----------

* Possible use js here is not justified, so is the idea of create a middleware using [RMagick](https://github.com/rmagick/rmagick). Help is welcome! 


Contributing
-------------

1. Fork it ( http://github.com/[my-github-username]/rails_env_favicon/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
