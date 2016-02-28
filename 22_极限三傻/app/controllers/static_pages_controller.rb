class StaticPagesController < ApplicationController
  def home
    @things = Thing.where(:erasure => false)
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
  
end
