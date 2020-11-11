class Public::ItemsController < ApplicationController
    def top
    end
    def index
        @items = Item.all
    end

    def show
        @item=Item.find(params[:id])
        @cart_item = CartItem.new
        @cart_item.item_id = @item.id
    end
    
end
