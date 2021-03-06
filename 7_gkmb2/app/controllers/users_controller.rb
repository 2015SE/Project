class UsersController < ApplicationController
    skip_before_filter :authenticate_user!
    skip_before_filter :authenticate_admin!, only: [:show]


    def admin_index
        @all_admin_users = User.where(:admin => true)
        @all_non_admin_users = User.where(:admin => false)
        @non_admin_users = @all_non_admin_users.page(params[:page]).per(50)
    end

    def admin_edit
        type = params[:type]

        @user = User.find(params[:id])
        if type == 'promote'
            @user.admin = true
        elsif type == 'demote'
            @user.admin = false
        end

        if @user.save
            flash[:info] = "The user was updated."
            redirect_to admin_users_path
        else
            redirect_to admin_users_path
        end
    end

    def show
        @user = User.find(params[:id])

        @all_topics = Topic.where(:user_id => @user.id)
        @all_posts = Post.where(:user_id => @user.id)
        @mixed = (@all_topics + @all_posts).sort_by(&:created_at).reverse
        @page_results = Kaminari.paginate_array(@mixed).page(params[:page]).per(10)
    end




end
