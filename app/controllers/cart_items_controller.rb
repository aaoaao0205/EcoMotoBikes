class CartItemsController < ApplicationController

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path, notice: 'カートから商品が削除されました。'
  end

  def update_quantity
    @cart_item = CartItem.find(params[:id])
    new_quantity = @cart_item.quantity + params[:quantity].to_i
    if new_quantity > 0
      @cart_item.update(quantity: new_quantity)
      redirect_to cart_path
    else
      @cart_item.destroy
      redirect_to cart_path
    end
  end
end

