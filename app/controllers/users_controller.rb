class UsersController < ApplicationController
    before_action :edit_is_only_teacher, only: [:edit, :update]

    def index
        # @users = User.order(number: "ASC")
        klass = params[:klass] || current_user.klass
        @users = User.students(klass).order(:number)
    end
    
    def show
        @user = current_user
        @user = User.find(params[:id])
    end

    def search
        @users = User.search(params[:q])
        render "index"
    end

    def new
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to @user, notice: "ユーザーを登録しました。"
        else
            render "new"
        end
    end

    def update
        @user = User.find(params[:id])
        @user.assign_attributes(user_params)
        if @user.save
            redirect_to :user, notice: "ユーザー情報を更新しました。"
        else
            render "edit"
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to :users, notice: "ユーザーを削除しました。"
    end

    # ストロングパラメータ
    private def user_params
        attrs = [
            :uid,
            :last_name,
            :first_name,
            :number,
            :klass,
            :role
        ]

        attrs << :password if params[:action] == "create"
            
        params.require(:user).permit(attrs)
    end
end
