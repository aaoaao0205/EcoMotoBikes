class CartsController < ApplicationController
  before_action :authenticate_user!, only: [:add_item]
  before_action :set_cart, only: [:show, :add_item]

  def show
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
    @cart = current_user.cart || current_user.create_cart
  end
end
