class AuthorController < ApplicationController
def author_page
    @user = User.find(params["id"])
    @gossips = Gossip.all
end
end
