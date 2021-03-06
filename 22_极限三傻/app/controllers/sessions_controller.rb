class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(mail: params[:session][:mail].downcase)
    if user && user.authenticate(params[:session][:password])  
      log_in user
      
      if params[:session][:remember_me] == '1'
        remember(user)
      else
        forget(user)
      end

      if current_user.admin?
        redirect_to audit_path
      else
        redirect_back_or user
      end

    else
      flash.now[:danger] = '邮箱密码不匹配' 
    render 'new'
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
  
end
