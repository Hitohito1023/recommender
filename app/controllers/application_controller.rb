class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :reject_inactive_user, only: [:create]


  def reject_inactive_user
    @user = User.find_by(email: params[:user][:email])
    if @user
      if @user.valid_password?(params[:user][:password]) && !@user.is_valid
        flash[:notice] = 'お客様は退会済みです。申し訳ございませんが、別のメールアドレスをお使いください。'
        redirect_to new_user_session_path
      end
    end
  end


  protected

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile_image, :introduction])
  end

end
