require 'bundler/setup'

require 'capybara/rspec'

require 'beanstalkd_view'

require "rails_helper"

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.dirname(__FILE__)+"/support/**/*.rb"].each  do |f|
  require f
end

#Capybara.default_driver = :selenium

RSpec.configure do |config|
  config.filter_run_excluding :requires_beanstalkd

  config.before(:each) do
    ENV['BEANSTALK_URL'] = 'beanstalk://localhost:11300'
  end
end
