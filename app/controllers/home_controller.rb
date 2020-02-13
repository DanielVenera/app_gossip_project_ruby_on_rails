class HomeController < ApplicationController
    def index
        @gossips = Gossip.all.sort_by(&:id).reverse
    end
end
