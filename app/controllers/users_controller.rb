class UsersController < ApplicationController

    before_action :user_logged_in!, except: [:index, :show]

    def index
    end

    def new
        @user = User.new
        @users = User.all
    end

    def create
        @users = User.all
        @user = User.new(user_params)

        if @user.save
            flash[:success] = "nya användare tillagd!"
            redirect_to root_url
        else
            render 'new'
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        flash[:success] = "adminstratören är borttagen"
        redirect_to '/users/new'
    end

    private

        def user_params
            params.require(:user).permit(:email, :password, :password_confirmation)
        end

end
