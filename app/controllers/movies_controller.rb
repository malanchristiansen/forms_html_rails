class MoviesController < ApplicationController
    def index
    end

    def create
        #puts params 
        if session[:movies] == nil 
            session[:movies] = []
        end 
        session[:movies].push(params[:movie])
        redirect_to movie_path(session[:movies].length)
    end

    def new
    end

    def show
        # exmaple of what's going in code below: session[:movies] = ["Avengers", "the dark knight"]
        @movie = session[:movies][params[:id].to_i - 1]
    end

    def edit
        @movie = session[:movies][params[:id].to_i - 1]
    end

    def update
        session[:movies][params[:id].to_i - 1] = params[:movie]
        redirect_to movie_path(params[:id].to_i)
    end
end
