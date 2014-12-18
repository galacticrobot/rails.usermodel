class SessionsController < ApplicationController
        def new
    end

    def create
        user = User.find_by email: params[:email].downcase
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            flash[:notice] = "Välkommen. Du är nu inloggad!"
            redirect_to root_path
        else
            flash.now[:notice] = "Felaktig e-postadress eller lösenord"
            render 'new'
        end
    end

    def destroy
        #hanteras av app_controller
        sign_out
        flash[:notice] = "Du är nu utloggad!"
        redirect_to root_path
    end
end
