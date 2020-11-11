class Admin::OrderDetailsController < ApplicationController
    before_action :authenticate_admin!
    
    def update
        @order_detail = OrderDetail.find(params[:id])
        @order = @order_detail.order


            if @order_detail.update(order_details_params)

                if @order_detail.produce_status == "producing"
                    @order_detail.order.order_status="producing"
                    @order_detail.order.save
                end
                a=0
                product_count=0
                @order.order_details.each do |f|
                    if f.produce_status=="complete"
                        a+=1
                    end
                    product_count += 1
                end
                if a==product_count
                    @order_detail.order.order_status="preparing"
                    @order_detail.order.save
                end
                redirect_to admin_order_path(@order.id) and return
            else
                
            end
        
    end

    def order_details_params
        params.require(:order_detail).permit(:produce_status)
    end
end