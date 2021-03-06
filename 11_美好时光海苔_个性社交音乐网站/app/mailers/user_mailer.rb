class UserMailer < ActionMailer::Base
  default from: "notify.ting@gmail.com"

  def reset_password_email(user)
    @user = user
    @url  = edit_password_reset_url(user.reset_password_token)
    mail(:to => user.email,
         :subject => "#{t('mailer.subject.reset_password')}")
  end

  def activation_needed_email(user)
    
  end

  def activation_success_email(user)
  
  end
end