module UrlAttribute
  module Attribute
    extend ActiveSupport::Concern

    module ClassMethods
      def url_attribute(*attributes)
        options = attributes.extract_options!

        attributes.each do |attribute|
          serialize attribute, UrlAttribute::Url
        end
      end
    end
  end
end