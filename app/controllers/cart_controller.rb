class CartController < ApplicationController
  before_action :authenticate_user!, :set_product_and_cart

  def add
    @cart.add(@product, @product)
  end

  def remove
    @cart.remove(@product, 1)
  end

  private
    def set_product_and_cart
      @cart = session[:cart] ? Cart.find(session[:cart]) : Cart.create
      @product = Product.find(params[:id])
    end
end