class CitiesController < ApplicationController
    def show
        @city = City.find(params[:id])
        @gossip = Gossip.all
    end

    def index
        @cities = City.all
    end

    
end
