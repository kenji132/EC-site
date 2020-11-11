class Public::OrdersController < ApplicationController
    before_action :ensure_cart_items, only: [:new, :confirm, :create]
    def index
        @orders = current_end_user.orders.all
    end

    def show
        @order=Order.find(params[:id])
    end

    def create
        if current_end_user.cart_items.exists?
            session[:order] = Order.new(order_params)
            @order=session[:order]
            @cart_items= current_end_user.cart_items.all
            session[:order][:postage]=800
            session[:order][:end_user_id]=current_end_user.id
            if params[:order][:address_option] == "0"  
                session[:order][:postcode]= current_end_user.postcode  
                session[:order][:street_address] = current_end_user.street_address
                session[:order][:name] = current_end_user.full_name
                
            elsif params[:order][:address_option] == "1"  
                @sta = params[:order][:order_address_id].to_i   
                @order_address = Address.find(@sta)  
                session[:order][:postcode] = @order_address.postcode  
                session[:order][:street_address] = @order_address.street_address 
                session[:order][:name] = @order_address.ship_name  

            elsif params[:order][:address_option] == "2"  
            end
            
            render :confirm
        else
            render :new
        end
        
    end
    
    def new
        @order=Order.new(session[:order])
    end
    
    def confirm
        @order=Order.new(session[:order])
        @cart_items= current_end_user.cart_items.all
    end
    
    
    
    def complete
        @order=Order.new(session[:order])
        if @order.save
            current_end_user.cart_items.each do |cart_item|
                # 注文商品テーブルにレコードを追加する
                session[:order_detail] = OrderDetail.new(order_detail_params)
                @order_detail=session[:order_detail]
                session[:order_detail][:item_id] = cart_item.item.id
                session[:order_detail][:amount] = cart_item.amount
                session[:order_detail][:tax_price] = (cart_item.item.without_tax*1.1).floor
                session[:order_detail][:order_id] = @order.id
                    
                @order_detail.save
            end
            session.delete(:order)
            cart_items = current_end_user.cart_items.all
            cart_items.destroy_all
        end
    end

    private
    def order_params
        params.require(:order).permit(:name, :postcode,:street_address,:end_user_id,:payment_method,:postage,:billing_amount)
    end
    def order_detail_params
        params.permit(:item_id,:cart_item,:amount,:tax_price,:order_id,:name)
    end

    def ensure_cart_items
        @cart_items = current_end_user.cart_items.includes(:item)
        redirect_to items_path unless @cart_items.first
    end
end
