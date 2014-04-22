module UrlAttribute
  module Attribute
    extend ActiveSupport::Concern

    module ClassMethods
      def url_attribute(*attributes)
        options = attributes.extract_options!

        serializer = options.fetch(:normalize, true) ? 
          UrlAttribute::NormalizedUrl :
          UrlAttribute::Url
          
        attributes.each do |attribute|
          serialize attribute, serializer

          define_method("#{attribute}=") do |url|
            write_attribute(attribute, serializer.load(url))
          end
        end

      end
    end
  end
end