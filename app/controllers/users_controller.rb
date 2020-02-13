class UsersController < ApplicationController
    def new
        @user = User.new
        @city = City.new
    end

    def create
        @city = City.create(name: params[:city])
        @user = User.new(password: params[:password], password_confirmation: params[:password_confirmation], age: params[:age], first_name: params[:first_name], last_name: params[:last_name], email: params[:email], city_id: @city.id)
        if @user.save
            @success = true
            session[:user_id] = @user.id
            render new_user_path
        else
            render new_user_path
        end
    end

    private

    def user_params
        params.require[:users].permit(:first_name, :last_name, :age, :email, :password, :password_confirmation)
    end

end
