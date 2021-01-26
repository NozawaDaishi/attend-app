class ApplicationController < ActionController::Base
    include SessionsHelper

    def login_required
        if logged_in?
            true
        else
            redirect_to :login
        end
    end
end
