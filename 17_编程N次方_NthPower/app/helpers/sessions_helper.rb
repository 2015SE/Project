module SessionsHelper
  # 登入指定的用户
  def log_in(user)
    session[:id] = user.id
  end
  # 返回当前登录的用户（如果有的话）
  def current_user
    @current_user ||= User.find_by(id: session[:id])
  end
end
