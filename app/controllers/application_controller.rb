class ApplicationController < ActionController::Base
    include SessionsHelper

    def required_logged_in
        if logged_in?
            true
        else
            redirect_to :login
        end
    end
end
