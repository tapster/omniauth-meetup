Dir[File.expand_path('../support/**/*', __FILE__)].each { |f| require f }
require 'bundler/setup'
require 'rspec'
require 'rack/test'
require 'webmock/rspec'
require 'omniauth'
require 'omniauth-meetup'

RSpec.configure do |config|
  config.include WebMock::API
  config.include Rack::Test::Methods
  config.extend  OmniAuth::Test::StrategyMacros, type: :strategy
end
