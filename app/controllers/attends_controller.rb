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

    private

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
