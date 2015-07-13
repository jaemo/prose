$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "prose/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "prose"
  s.version     = Prose::VERSION
  s.authors     = ["James Martens"]
  s.email       = ["jm@jjonah.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Prose."
  s.description = "TODO: Description of Prose."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.1"
  s.add_dependency "haml", "~> 4.0.6"
  s.add_dependency "awesome_nested_set"
  s.add_dependency "friendly_id"
  s.add_dependency "coffee-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "capybara"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "pry-rails"
  s.add_development_dependency "shoulda-matchers"
end
