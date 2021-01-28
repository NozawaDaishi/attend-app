class ApplicationController < ActionController::Base
    include SessionsHelper
    before_action :login_required

    private

    def login_required
        redirect_to :login unless logged_in?
    end

    def edit_is_only_teacher
        redirect_to user_url unless current_user.teacher?
    end
end
