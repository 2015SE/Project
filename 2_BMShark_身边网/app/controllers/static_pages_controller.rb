class StaticPagesController < ApplicationController
  def home
  end
  
  def about
  end
  
  def shop
    @users = User.all
	@shops = Shop.all
  end
  def product
    @users=User.all
	@products = Product.all
  end
end
