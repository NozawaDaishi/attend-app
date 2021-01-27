class UsersController < ApplicationController
    def index
        @users = User.order(number: "ASC")
    end
    
    def show
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
        @user = User.new(params[:user])
        if @user.save
            log_in @user
            redirect_to @user, notice: "ユーザーを登録しました。"
        else
            render "new"
        end
    end

    def update
        @user = User.find(params[:id])
        @user.assign_attributes(params[:user])
        if @user.save
            redirect_to @user, notice: "ユーザー情報を更新しました。"
        else
            render "edit"
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to :users, notice: "ユーザーを削除しました。"
    end

end
