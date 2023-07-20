# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
    @gender_options = User.genders.keys.map { |key| [I18n.t("enums.user.gender.#{key}"), key] }
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to events_path, success: 'ユーザー登録が完了しました'
    else
      @gender_options = User.genders.keys.map { |key| [I18n.t("enums.user.gender.#{key}"), key] }
      flash.now[:danger] = 'ユーザー登録に失敗しました'
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation, :gender)
  end
end
