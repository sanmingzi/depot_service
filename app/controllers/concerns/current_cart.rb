module CurrentCart
  private
    def set_cart
      @cart = nil
      if current_user
        current_user.build_cart.save if nil == current_user.cart
        @cart = current_user.cart
      end
    end
end
