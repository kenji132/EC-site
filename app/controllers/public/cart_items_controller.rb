class Public::CartItemsController < ApplicationController
    def index
        @cart_items = current_end_user.cart_items.all
        @cart_item=CartItem.new
    end

    def create
        @cart_items = current_end_user.cart_items.all
        @cart_item=CartItem.new(cart_item_params)
        @cart_item.end_user_id=current_end_user.id
        @cart_items.each do |cart_item|
            if cart_item.item_id == @cart_item.item_id
              new_amount = cart_item.amount + @cart_item.amount
              cart_item.update_attribute(:amount, new_amount)
              @cart_item.destroy
            end 
        end
        if @cart_item.save
            redirect_to cart_items_path
        else
            render :index
            
        end
    end

    def update
        @cart_items=current_end_user.cart_items.all
        @cart_item = CartItem.find(params[:id])
        @cart_item.end_user_id=current_end_user.id
        if @cart_item.update(cart_item_params)
            redirect_to cart_items_path
        else
            render :index
        end
    end

    def destroy
        @cart_item=CartItem.find(params[:id])
        if @cart_item.destroy
            redirect_to cart_items_path
        else
           render :index
        end
    end

    def destroy_all
        @cart_items=current_end_user.cart_items.all
        if @cart_items.destroy_all
            redirect_to cart_items_path
        else
           render :index
        end
    end

    private
    def cart_item_params
        params.require(:cart_item).permit(:amount,:end_user_id,:item_id)
    end

end
