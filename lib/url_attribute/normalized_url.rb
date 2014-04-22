module UrlAttribute
  class NormalizedUrl < Url
    def initialize(url)
      super

      @uri = URI.parse("http://#{url}") if @uri && @uri.scheme.blank?
    rescue URI::InvalidURIError
    end
  end
end