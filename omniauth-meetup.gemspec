# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth-meetup/version"

Gem::Specification.new do |gem|
  gem.name        = "omniauth-meetup"
  gem.version     = Omniauth::Meetup::VERSION
  gem.authors     = ["Miles Woodroffe"]
  gem.email       = ["miles@thespecials.com"]
  gem.homepage    = "http://github.com/tapster/omniauth-meetup"
  gem.description = %q{Meetup.com authentication handler for OmniAuth}
  gem.summary     = gem.description

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.require_paths = ["lib"]

  # specify any dependencies here; for example:
  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.0'
  gem.add_development_dependency 'rspec', '~> 2.7'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'
end
