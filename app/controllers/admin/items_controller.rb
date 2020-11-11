class Admin::ItemsController < ApplicationController
    def index
        @items = Item.all
        @items = Item.search(params[:name])
    end

    def new
        @item = Item.new
        @items = Item.search(params[:name])
    end

    def create
        @item = Item.new(item_params)
        if @item.save
            redirect_to admin_item_path(@item.id)
        else
            render :new
        end
    end

    def show
        @item = Item.find(params[:id])
        @items = Item.search(params[:name])
    end

    private
    def item_params
        params.require(:item).permit(:name,:genre_id,:description,:without_tax, :image, :is_sold)
    end
end
