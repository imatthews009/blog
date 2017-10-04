class PostsController < ApplicationController
before_action :find_post, only:[:show, :edit, :update, :destroy]

before_action :authenticate_user!, except: [:index, :show] #This allows users to view index or show page without logging in but for any other page they will be redirected to the sign up page if they aren't logged in.

    def index
        @post = Post.all.order("created_at desc").paginate(page: params[:page], per_page: 2)
    end

    def new
        @post = Post.new()
    end

    def create 
        new_post = Post.new(post_params)
        if new_post.save
            redirect_to new_post, notice: "Article saved"
        else
            render 'new', notice: "Article not saved"
        end
    end

    def show
        #nothing added because of the before action
    end

    def edit
        #nothing added because of the before action
    end

    def update
        #@post comes from find_post
        #the fiels are auto populated due to post_params
        if @post.update(post_params)
            redirect_to @post
        else
            render 'edit'
        end
    end

    def destroy
        @post.destroy
        redirect_to posts_path
    end

    private

    def post_params
        params.require(:post).permit(:title, :content)
    end

    #find post method because it is used frequently
    def find_post
        @post = Post.find(params[:id])
    end
end
