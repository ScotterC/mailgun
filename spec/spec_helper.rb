$:.unshift File.expand_path("../lib", File.dirname(__FILE__))
require 'simplecov'
SimpleCov.start
require 'ruby-debug'
require "rspec"
require "mailgun"

RSpec.configure do |config|
end
