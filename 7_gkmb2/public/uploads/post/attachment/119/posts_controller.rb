# class PostsController < ApplicationController
#     before_action :find_post, only: [:show, :edit,:update,:destroy]
#
#     skip_before_filter :authenticate_user!,  :only => [:show]
#     skip_before_filter :authenticate_admin!, :except => [:destroy]
#     before_filter :set_cat
#     before_filter :set_topic
#
#     def index
#     end
#
#     def show
#
#         # @user = User.find(@post.user_id)
#         # @post = Post.find(params[:id])
#         @post = @post.find(params[:id])
#
#
#
#     end
#
#     def new
#         @user = User.find(@topic.user_id)
#         @post = Post.new
#     end
#
#     def edit
#         set_post
#     end
#
#     def create
#         @post = Post.new(post_params)
#         @post.user_id = current_user.id
#         @post.topic_id = @topic.id
#         @topic.last_activity_at = Time.now
#         @topic.last_activity_user_id = current_user.id
#         @cat.last_activity_at = Time.now
#         @cat.last_activity_user_id = current_user.id
#
#         if @post.save && @topic.save && @cat.save
#             flash[:success] = "A new post was created."
#             # Be sure to update the category's last_activity_at field
#             redirect_to [@cat, @topic,@post]
#         else
#             @user = User.find(@topic.user_id)
#             render action: 'new'
#         end
#     end
#
#     def update
#         set_post
#         if @post.update(post_params)
#             flash[:info] = "The post was updated."
#             redirect_to [@cat, @topic]
#         else
#             render action: 'edit'
#         end
#     end
#
#     def destroy
#         set_post
#         @post.destroy
#         flash[:info] = "The post was deleted."
#         redirect_to [@cat, @topic]
#     end
#
#     private
#         # Use callbacks to share common setup or constraints between actions.
#
#
#         def set_post
#             @post = Post.find(params[:id])
#         end
#
#         # Never trust parameters from the scary internet, only allow the white list through.
#         def post_params
#             params.require(:post).permit(:body,:biaoti,:image)
#         end
#         def find_post
#           @post =Post.find(params[:id])
#         end
# end
class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit,:update,:destroy]
    skip_before_filter :authenticate_user!,  :only => [:show]
    skip_before_filter :authenticate_admin!, :except => [:destroy]
    before_filter :set_cat
    before_filter :set_topic

    def index
        @posts = Post.all.order("created_at DESC")

    end

    def show


        @post = Post.find(params[:id])

    end

    def new
        @user = User.find(@topic.user_id)
        @post = Post.new
    end

    def edit
        set_post
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        @post.topic_id = @topic.id
        # @post = @topic.posts.create(params[:post].permit(:post))


        @topic.last_activity_at = Time.now
        @topic.last_activity_user_id = current_user.id
        @cat.last_activity_at = Time.now
        @cat.last_activity_user_id = current_user.id

        if @post.save && @topic.save && @cat.save
            flash[:success] = "A new post was created."
            # Be sure to update the category's last_activity_at field
            redirect_to [@cat, @topic]
        else
            @user = User.find(@topic.user_id)
            render action: 'new'
        end
    end

    def update
        set_post
        if @post.update(post_params)
            flash[:info] = "The post was updated."
            redirect_to [@cat, @topic]
        else
            render action: 'edit'
        end
    end

    def destroy
        set_post
        @post.destroy
        flash[:info] = "The post was deleted."
        redirect_to [@cat, @topic]
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_cat
        @cat = Category.find(params[:category_id])
    end

    def set_topic
        @topic = Topic.find(params[:topic_id])
    end

    def set_post
        @post = Post.find(params[:post_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
        params.require(:post).permit(:body,:biaoti,:image,:topic_id,:attachment,:fujianname)
    end
    def find_post
           @post =Post.find(params[:id])

    end


end

