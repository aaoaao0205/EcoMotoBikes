class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :add_item]

  def show
    @cart = current_user.cart
    @cart_items = @cart.items
  end
  

  def add_item
    item = Item.find(params[:id])
    @cart.items << item

    if @cart.save
      redirect_to cart_path(@cart), notice: 'Item was successfully added to cart.'
    else
      redirect_to items_path, alert: 'There was an error adding the item to the cart.'
    end
  end

  private

  def set_cart
    @cart = current_user.cart || Cart.new
  end
end

