class AttendsController < ApplicationController
    def index
        @today = Time.zone.now.strftime('%Y-%m-%d')

        if current_user.teacher?
            @klass = params[:klass] || current_user.klass
            @students = User.students(@klass)
        else
            # 2021年1月19日から学校が始まった想定で計算
            start_date = Date.parse('2021-01-19')
            # 学校が始まった日から昨日までの営業日数を計算
            business_days_to_date = start_date.business_days_until(Date.today) + 1
            # 今までの出席日数を取得
            total_attend_days = current_user.attends.count
        end
    end
end
