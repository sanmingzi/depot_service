class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  belongs_to :user
  delegate :empty?, to: :line_items

  def add_product(product)
    item = line_items.find_by(product_id: product.id)
    if item
      item.quantity += 1
    else
      item = line_items.build(product_id: product.id)
    end
    item
  end

  def total_price
    line_items.sum(&:total_price)
  end
end
