require 'rmagick'

module RailsEnvFavicon
  class Middleware
    def initialize(app, options = {})
      @app = app
    end

    def call(env)
      unless env['PATH_INFO'] =~ %r{\/favicon\.(?:png|ico)\z}xm
        return @app.call(env)
      end

      env.delete('HTTP_IF_MODIFIED_SINCE') # do not cache the icon file

      status, headers, response = @app.call(env)

      data = ''
      response.each do |buf|
        data << buf
      end

      img = Magick::Image.from_blob(data) do |info|
        info.format = 'ICO'#headers['Content-Type'] =~ /png/ ? 'PNG' : 'ICO'
      end[0]
      img = img.quantize(256, Magick::GRAYColorspace)

      # trying not to cache (not worked)
      headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
      headers["Pragma"] = "no-cache"
      headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
      headers["Last-Modified"] = "Fri, 01 Jan 1990 00:00:00 GMT"
      [status, headers, [img.to_blob]]
    end
  end
end
