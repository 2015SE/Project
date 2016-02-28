module UsersHelper
  # 如果参数给定的用户是当前用户返回真
  def current_user?(user)
    user == current_user
  end

  def require_login
    if !logged_in?
      redirect_to login_url
      flash[:warning] ="#{I18n.t('users.login_first')}"
    end
  end
end
