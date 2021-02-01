class ApplicationController < ActionController::Base
    include SessionsHelper
    before_action :login_required

    private

        def login_required
            redirect_to :login unless logged_in?
        end

        def must_be_teacher
            redirect_to root_url unless current_user.teacher?
        end

        def prevent_other_students_from_seeing
            redirect_to root_url if !current_user.teacher? && current_user.id.to_s != params[:id]
        end
end
