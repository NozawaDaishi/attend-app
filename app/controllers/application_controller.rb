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

        def calc_attend_rate(user)
            # 2021年1月19日から学校が始まった想定で計算
            start_date = Date.parse('2021-01-19')
            # 学校が始まった日から昨日までの営業日数を計算
            total_business_days = start_date.business_days_until(Date.today) + 1
            # 今までの出席日数を取得
            total_attend_days   = user.attends.count

            (total_attend_days / total_business_days.to_f * 100).round(2)
        end
end
