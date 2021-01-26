class AttendsController < ApplicationController
    def index
        @today = Time.zone.now.strftime('%Y-%m-%d')

        if current_user.teacher?
            @klass = params[:klass] || current_user.klass
            @students = User.students(@klass)
        end
    end
end
