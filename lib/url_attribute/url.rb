module UrlAttribute
  class Url
    def initialize(url)
      @uri = URI.parse(url)
    end

    class << self
      def dump(url)
        return nil if url.nil?

        url.to_s
      end

      def load(url)
        new(url)
      end
    end
  end
end