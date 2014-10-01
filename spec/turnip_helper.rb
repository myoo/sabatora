# -*- coding: utf-8 -*-
require 'turnip'
require 'turnip/capybara'
require 'turnip/rspec'
require 'capybara'
require 'capybara/poltergeist'

#各種driverの設定
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, {:js_errors => false, :default_wait_time => 30, :timeout => 100})
end

# #mobileのuseragent
# Capybara.register_driver :mobile do |app|
#   Capybara::RackTest::Driver.new(app,
#     :headers => {'HTTP_USER_AGENT' => '※適宜好きなものを'})
# end

# #pcのuseragent
# Capybara.register_driver :pc do |app|
#   Capybara::RackTest::Driver.new(app,
#     :headers => {'HTTP_USER_AGENT' => '※適宜好きなものを'})
# end

Capybara.configure do |config|
#  config.default_driver = :pc
  config.javascript_driver = :poltergeist
  config.ignore_hidden_elements = true
  config.default_wait_time = 30
end

WebMock.disable_net_connect!(:allow_localhost => true)
