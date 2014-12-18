class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :current_user?

    private
        def user_logged_in!
            return if current_user.present?
            flash[:error] = "Vänligen logga in för att komma åt denna sida"
            redirect_to login_url
        end

        def sign_out
            session[:user_id] = nil
            #reset_session
        end

        def current_user
            #return user if it is already set OR set it to:
            @current_user ||= User.find_by id: session[:user_id] if session[:user_id]
        end

        #med if statement om användaren är inloggad
        def current_user?
            current_user_present?
        end

end
