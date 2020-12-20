class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :unsubscribe, :withdraw]
  before_action :ensure_correct_user, only: [:edit, :update, :unsubscribe, :withdraw]

  def index
    @users = User.only_valid
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: '会員情報の更新が完了しました。'
    else
      render :edit
    end
  end


  def unsubscribe
    @user = current_user
  end

  def withdraw
    @user = User.find(current_user.id)
    @user.post_items.delete_all
    @user.update(is_valid: false)
    reset_session
    redirect_to root_path
  end

  def thanks
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile_image, :introduction)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

end
