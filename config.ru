require 'bundler/setup'

ENV['BEANSTALK_URL'] ||= 'beanstalk://localhost/'
ENV['BEANSTALKD_VIEW_PATH'] ||= '/'

require 'beanstalkd_view'
run Rack::URLMap.new(
  ENV['BEANSTALKD_VIEW_PATH'] => BeanstalkdView::Server
)
