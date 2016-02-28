class UsersController < ApplicationController
	before_action :signed_in_user,only: [:edit, :update]
	before_action :correct_user,only: [:edit, :update]
	def show
		@user = User.find(params[:id])
	end
	def new
		@user=User.new
	end
	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "欢迎来到身边网!"
			redirect_to @user
		else
			render 'new'
		end
	end
	def edit
	end
	def update
		if @user.update_attributes(user_params)	
			flash[:success] = "修改成功！"
			sign_in @user
			redirect_to @user
		else
			render 'edit'
		end
	end
	def redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		session.delete(:return_to)
	end
	def store_location
		session[:return_to] = request.fullpath
	end
	private
	def user_params
		params.require(:user).permit(:name, :telephone,:address,:email, :password,
		:password_confirmation)
	end
	def signed_in_user
		unless signed_in?
			store_location
			redirect_to signin_url, notice: "请登录" unless signed_in?
		end
	end
	def correct_user
		@user = User.find(params[:id])
		redirect_to root_path, notice:"无权限" unless current_user?(@user)
	end
end
