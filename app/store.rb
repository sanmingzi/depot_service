# This file used by store.ru

require 'builder'
require 'active_record'

ActiveRecord::Base.establish_connection('mysql2://root:root@127.0.0.1/depot_service_production')

class Product < ActiveRecord::Base
end

class StoreApp
  def call(env)
    x = Builder::XmlMarkup.new ident: 2
    x.declare! :DOCTYPE, :html
    x.html do
      x.head do
        x.title 'Bookshelf'
      end
      x.body do
        x.h1 'Bookshelf'
        Product.all.each do |product|
          x.h2 product.title
          x << "      #{product.description}\n"
          x.p product.price
        end
      end
    end
    response = Rack::Response.new(x.target!)
    response['Content-Type'] = 'text/html; charset=UTF-8'
    response.finish
  end
end
