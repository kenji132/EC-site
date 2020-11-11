class Admin::OrdersController < ApplicationController
    def index
        @orders = Order.all
        @items = Item.search(params[:name])
    end

    def show
        @order=Order.find(params[:id])
        @order_details = @order.order_details
        @items = Item.search(params[:name])
    end

    def update
        @order=Order.find(params[:id])
        if @order.update(orders_status_params) 
            if @order.order_status == "confirm"
                @order.order_details.each do |f|
                    f.produce_status= "waiting"
                    f.save
                end
            end
            redirect_to admin_order_path(@order)
        end
        # if @order.update(orders_status_params) && @order.confirm?
        #     @order.order_details.update_all(making_status: 1)
        # end
        # redirect_to admin_order_path(@order)

    end

    def orders_status_params
        params.require(:order).permit(:order_status)
    end
end
