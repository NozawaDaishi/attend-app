class SessionsController < ApplicationController
    skip_before_action :login_required

    def new
    end

    def create
        user = User.find_by(number: params[:session][:number].downcase)
        if user && user.authenticate(params[:session][:password])
            log_in user
            redirect_to root_url, notice: 'ログインしました。'
        else
            flash.now[:danger] = 'Invalid number/password combination'
            render 'new'
        end
    end

    def destroy
        log_out
        redirect_to root_url, notice: 'ログアウトしました。'
    end
end
