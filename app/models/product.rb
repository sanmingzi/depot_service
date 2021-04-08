class Product < ApplicationRecord
  validates :title, presence: true, uniqueness: {case_sensitive: true}
  validates :description, presence: true
  validates :image_url, presence: true, format: {
    with: /.(gif|jpg|png)/,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
end
