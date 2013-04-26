$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rumbambar/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'Rumbambar'
  s.version     =  Rumbambar::VERSION
  s.authors     = ['Volodymyr Ladnik']
  s.email       = ['Volodymyr.UA@gmail.com']
  s.homepage    = 'https://github.com/vladnik/Rumbambar'
  s.summary     = 'Evented ROR engine for servers administrations'
  s.description = 'Rumbambar is evented Ruby on Rails engine for multiple servers administration, deployment and analytics'

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency 'rails', '~> 3.2.13'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'devise'

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'sqlite3'
end
