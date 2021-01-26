class AttendsController < ApplicationController
    def index
        if current_user.teacher?
            @klass = params[:klass] || current_user.klass
            @today = Time.zone.now.strftime('%Y-%m-%d')
            @students = User.students(@klass)
        end
    end
end
