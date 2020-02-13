class GossipController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  include SessionsHelper

  def show
    @comment = Comment.where(gossip_id: @gossip.id).sort_by(&:id).reverse
  end

  def create
    current_user
    @gossip = Gossip.new(user_id: current_user.id, content: params[:content], title: params[:title])
    if @gossip.save
      @success = true
      render "gossip/new"
    else
      render "gossip/new"
    end
  end

  def new
    @gossip = Gossip.new
  end

  def edit
  end

  def update
    gossip_params = params.require(:gossip).permit(:title, :content)
    if @gossip.update(gossip_params)
      redirect_to @gossip
    else
      :edit
    end
  end

  def destroy
    @gossip.destroy
    redirect_to "/"
  end
end

private

def find_post
  @gossip = Gossip.find(params[:id])
end
