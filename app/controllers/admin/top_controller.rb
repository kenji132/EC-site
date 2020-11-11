class Admin::TopController < ApplicationController
    def top
        @items = Item.search(params[:name])
    end
end
