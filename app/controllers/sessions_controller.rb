class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    flash[:danger] = ' '
    if @user && @user.authenticate(params[:password])
      flash[:danger] = 'Good !'
      session[:user_id] = @user.id 
      @success = true
      render 'new'
    else 
      flash[:danger] = 'Invalid email or password'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
