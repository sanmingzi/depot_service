# bundle exec rails test:models

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  def new_product(title: 'another title', description: 'another description', image_url: 'another.jpg', price: 49.0)
    Product.new(title: title, description: description, image_url: image_url, price: price)
  end

  test 'product attributes must not be empty' do
    Product.new.tap do |p|
      assert p.invalid?
      [:title, :description, :image_url, :price].each do |attr|
        assert p.errors[attr].any?
      end
    end
  end

  test 'product title must be unique' do
    new_product(title: 'Ruby Metaprogramming').tap do |p|
      assert p.invalid?
      assert_equal ['has already been taken'], p.errors[:title]
    end
  end

  test 'product image_url must be gif|jpg|png' do
    ['ruby.gif', 'ruby.jpg', 'ruby.png'].each do |image_url|
      new_product(image_url: image_url).tap { |p| assert p.valid?, "#{image_url} shouldn't be invalid" }
    end
    ['ruby.more', 'ruby', 'ruby.other'].each do |image_url|
      new_product(image_url: image_url).tap { |p| assert p.invalid?, "#{image_url} shouldn't be valid" }
    end
  end

  test 'product price must be positive' do
    new_product.tap { |p| assert p.valid? }
    new_product(price: 0).tap { |p|
      assert p.invalid?
      assert_equal p.errors[:price], ['must be greater than or equal to 0.01']
    }
  end
end
