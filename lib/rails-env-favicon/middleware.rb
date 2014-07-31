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

      env.delete('HTTP_IF_MODIFIED_SINCE')

      status, headers, response = @app.call(env)

      data = ''
      response.each do |buf|
        data << buf
      end

      if data.present? && data != 'Not Found'
        img = Magick::Image.from_blob(data) do |info|
          info.format = headers['Content-Type'] =~ /png/ ? 'PNG' : 'ICO'
        end

        img = img[img.size - 1] # get last from multi-size ico
        img = img.quantize(256, Magick::GRAYColorspace)

        # do not to cache the icon
        headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
        headers["Pragma"] = "no-cache"
        headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
        headers["Last-Modified"] = "Fri, 01 Jan 1990 00:00:00 GMT"

        img_blob = img.to_blob

        # without corrent Content-Length not working in Chrome
        headers["Content-Length"] = img_blob.size.to_s
        [status, headers, [img_blob]]
      else
        [status, headers, response]
      end
    end
  end
end
