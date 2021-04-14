class StoreController < ApplicationController
  include CurrentCart

  before_action :set_cart
  skip_before_action :authenticate, only: [:index]

  def index
    @products = Product.order(:title)
  end
end
