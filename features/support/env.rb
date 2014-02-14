# Generated by cucumber-sinatra. (2014-02-14 10:41:46 +0000)

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'app/chitter.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

Capybara.app = Chitter

class ChitterWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  ChitterWorld.new
end
