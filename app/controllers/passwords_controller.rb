class PasswordsController < ApplicationController
  before_action :prevent_other_students_from_seeing, only: [:show, :edit]
  
  def show
    redirect_to :user
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    current_password = user_params[:current_password]

    if current_password.present?
      if @user.authenticate(current_password)
        @user.assign_attributes(user_params)
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

  # ストロングパラメータ
  private def user_params
    params.require(:user).permit(
      :current_password,
      :password,
      :password_confirmation
    )
  end
end
