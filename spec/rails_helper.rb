ENV["RAILS_ENV"] = "test"

require "action_controller/railtie"

module BeanstalkdView
  class RailsApp < ::Rails::Application
    config.root = File.dirname(__FILE__) + "/rails_app"
    config.secret_key_base = 'test_secret_key_base_for_beanstalkd_view_specs'
    config.eager_load = false
  end
end

BeanstalkdView::RailsApp.initialize!
