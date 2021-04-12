class Order < ApplicationRecord
  enum pay_type: {
    'Check' => 0,
    'Credit card' => 1,
    'Purchase order' => 2
  }

  has_many :line_items

  validates :name, presence: true
  validates :address, presence: true
  validates :email, presence: true, format: {
    with: /@\w+\.com/,
    message: 'must be a email'
  }
  validates :pay_type, inclusion: pay_types.keys

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end