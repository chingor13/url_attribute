module UrlAttribute
  class Railtie < ::Rails::Railtie

    initializer "url_attribute" do
      require 'url_attribute/url_validator'
      ActiveSupport.on_load :active_record do
        include UrlAttribute::Attribute
      end
    end

  end
end