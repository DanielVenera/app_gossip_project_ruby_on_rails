class HomeController < ApplicationController
    def show
        @gossips = Gossip.all
    end
end
