class Admin::EndUsersController < ApplicationController
    def index
        @end_user = EndUser.all
        @items = Item.search(params[:name])
    end
end
