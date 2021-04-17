# rackup store.ru
# http://localhost:9292/store

require 'rubygems'
require 'bundler/setup'

require './app/store'

use Rack::ShowExceptions

map '/store' do
  run StoreApp.new
end
