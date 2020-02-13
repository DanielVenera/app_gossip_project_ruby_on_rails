class CitiesController < ApplicationController
    def show
        @city = City.find(params[:id])
        @users = User.all 
        @gossip = Gossip.all
    end

    def index
        @cities = City.all
    end

    
end
