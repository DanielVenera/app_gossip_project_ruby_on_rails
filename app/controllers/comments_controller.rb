class CommentsController < ApplicationController
  include SessionsHelper
  def create
    current_user
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.create(content: comment_params[:content], gossip_id: @gossip.id, user_id: current_user.id)
    redirect_to gossip_path(@gossip)
  end

  def edit
    @gossip = Gossip.find(params[:gossip_id])
    @comments = Comment.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:gossip_id])
    comment_params_update = params.require(:comment).permit(:content)
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params_update)
    render gossip_path(@gossip.id)
    else
      :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to gossip_path(@gossip.id)
  end
end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

