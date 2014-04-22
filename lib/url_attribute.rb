require 'uri'

module UrlAttribute
  autoload :Attribute, "url_attribute/attribute"
  autoload :NormalizedUrl, "url_attribute/normalized_url"
  autoload :Url, "url_attribute/url"
end

require 'url_attribute/railtie'