class AttendsController < ApplicationController
    def index
        @today = Time.zone.now.strftime('%Y-%m-%d')
        @myklass = User.myklass('R4A1')
        # if current_user&.teacher?
        #     @current_attendance = 
        #     User.myklass('R4A1').each do |user|
        #         user.attends.where("date LIKE ?", "%#{today}%")
        #     end
        # end
    end
end
