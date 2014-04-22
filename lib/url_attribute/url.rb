module UrlAttribute
  class Url
    attr_reader :uri, :url

    def initialize(url)
      @url = url
      @uri = URI.parse(url)
    rescue URI::InvalidURIError
    end

    class << self
      def dump(url)
        return nil if url.nil?

        url.to_s
      end

      def load(url)
        url.nil? ? nil : new(url)
      end
    end

    def to_s
      url.to_s
    end

    def valid?
      uri.present?
    end

  end
end