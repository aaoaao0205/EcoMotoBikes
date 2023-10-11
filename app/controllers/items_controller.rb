class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item)
    else
      render :new
    end
  end
end
