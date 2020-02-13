class LikesController < ApplicationController
  before_action :find_gossip
  before_action :find_like, only: [:destroy]
  include SessionsHelper
  before_action :current_user

  def create
    if already_liked?
        flash[:message] = "You can't like more than once"
      else
    @gossip.likes.create(user_id: current_user.id)
      end
    redirect_to gossip_path(@gossip)
  end

 

  private

  def find_gossip
    @gossip = Gossip.find(params[:gossip_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, gossip_id: params[:gossip_id]).exists?
  end


end
