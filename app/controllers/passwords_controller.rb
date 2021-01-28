class PasswordsController < ApplicationController
  
  def show
    redirect_to :user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    current_password = params[:user][:current_password]
    puts "+" * 50
    puts current_password

    if current_password.present?
      if @user.authenticate(current_password)
        @user.assign_attributes(params[:user])
        if @user.save
          redirect_to :user, notice: "パスワードを変更しました。"
        else
          render "edit"
        end
      else
        @user.errors.add(:current_password, :wrong)
        render "edit"
      end
    else
      @user.errors.add(:current_password, :empty)
      render "edit"
    end
  end
end
