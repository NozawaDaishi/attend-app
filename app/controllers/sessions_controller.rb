class SessionsController < ApplicationController
    def create
        user = User.find_by(student_number: params[:student_number])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
        else
            flash.alert = "学籍番号とパスワードが一致しません"
        end
        redirect_to :root
    end

    def destroy
        session.delete(:user_id)
        redirect_to :root
    end
end
