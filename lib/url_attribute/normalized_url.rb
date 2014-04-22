module UrlAttribute
  class NormalizedUrl < Url
    def initialize(url)
      super

      if @uri && @uri.scheme.blank?
        @uri = URI.parse("http://#{url}")
        @url = @uri.to_s
      end
    rescue URI::InvalidURIError
    end
  end
end