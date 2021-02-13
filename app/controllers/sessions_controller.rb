class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to admin_path
    end
    @form = Sessions::Form.new
  end

  def create
    @form = Sessions::Form.new(login_params)
    if @form.authenticate
      session[:user_id] = @form.user.id
      redirect_to admin_path
    else
      render text: '用户名和密码不正确', status: :unprocessable_entity
    end
  end

  def destroy
    session.delete :user_id
    redirect_to :root, notice: '已登出'
  end

  private
  def login_params
    params.require(:user).permit(:email, :password)
  end
end
