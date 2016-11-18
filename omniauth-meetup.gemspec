# -*- encoding: utf-8 -*-
Gem::Specification.new do |gem|
  gem.name        = 'omniauth-meetup'
  gem.version     = '0.0.8'
  gem.authors     = ['Miles Woodroffe']
  gem.email       = ['miles@thespecials.com']
  gem.homepage    = 'http://github.com/tapster/omniauth-meetup'
  gem.description = 'Meetup.com authentication handler for OmniAuth'
  gem.summary     = gem.description

  gem.require_paths = ['lib']
  gem.files = ['.gitignore', '.rspec', '.travis.yml', 'Gemfile', 'README.md', 'Rakefile', 'lib/omniauth-meetup.rb', 'lib/omniauth-meetup/version.rb', 'lib/omniauth/strategies/meetup.rb', 'omniauth-meetup.gemspec']
  gem.test_files = ['./spec/omniauth/strategies/meetup_spec.rb', 'spec/spec_helper.rb']

  # specify any dependencies here; for example:
  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.0'
  gem.add_development_dependency 'rspec', '~> 2.7'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'webmock'
end
