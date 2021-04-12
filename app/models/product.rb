class Product < ApplicationRecord
  has_many :line_items
  before_destroy  :ensure_not_referenced_by_any_line_item

  validates :title, presence: true, uniqueness: {case_sensitive: true}
  validates :description, presence: true
  validates :image_url, presence: true, format: {
    with: /\.(gif|jpg|png)/,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
end
