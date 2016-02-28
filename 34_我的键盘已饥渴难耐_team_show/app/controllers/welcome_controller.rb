class WelcomeController < ApplicationController
  def _nav
  end
  def error
  end
  def index
    @articles = Article.all.reverse_order
    @notices  = Notice.all.reverse_order
    @projects = Project.all.reverse_order
    if params[:operation] == 'log_out'
      session[:ut] = nil
      session[:un] = nil
    end
  end
end
