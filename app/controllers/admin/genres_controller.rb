class Admin::GenresController < ApplicationController
    def index
        @genres = Genre.all
        @genre = Genre.new
        @items = Item.search(params[:name])
    end

    def create
        @items = Item.search(params[:name])
        @genres = Genre.all
        @genre = Genre.new(genre_params)
        if @genre.save
            redirect_to admin_genres_path
        else
           render :index
        end
    end

    def edit
        @items = Item.search(params[:name])
        @genre = Genre.find(params[:id])
    end

    def update
        @items = Item.search(params[:name])
        @genre = Genre.find(params[:id])
        @genres= Genre.all
        if @genre.update(genre_params)
            redirect_to admin_genres_path
        else
           render :edit
        end
    end

    private
    def genre_params
        params.require(:genre).permit(:genre_name,:is_effective)
    end
end
