class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
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
  end

  def withdraw
  end

  def thanks
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
