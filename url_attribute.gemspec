$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "url_attribute/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "url_attribute"
  s.version     = UrlAttribute::VERSION
  s.authors     = ["Jeff Ching"]
  s.email       = ["ching.jeff@gmail.com"]
  s.homepage    = "http://github.com/chingor13/url_attribute"
  s.summary     = "ActiveModel field serializer for url fields"
  s.description = "ActiveModel field serializer for url fields"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.2.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "shoulda-context"
end
