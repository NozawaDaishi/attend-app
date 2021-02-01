class AttendsController < ApplicationController
    def index
        @now = Time.zone.now

        if current_user.teacher?
            @klass = params[:klass] || current_user.klass
            @students = User.students(@klass)
            @attend_rate_list = @students.map { |user| calc_attend_rate(user) }
        else
            @attend_rate = calc_attend_rate(current_user)
        end
    end
end
