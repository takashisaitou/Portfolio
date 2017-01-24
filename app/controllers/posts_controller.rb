class PostsController < ApplicationController
  # before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def show
  end

  def index
    @posts = Post.page(params[:page]).per(5).order(created_at: :desc)
    # @posts = Post.all
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path, notice: "投稿が保存されました"
    else
      render 'home/top'
    end
  end

  def update

    if @post.update(post_params)
      redirect_to @post, notice: "投稿が更新されました"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:content, :image)
    end

    def correct_user
      post = Post.find(params[:id])
      if !current_user?(post.user)
        redirect_to root_path, alert: '許可されていないページです'
      end
    end

end
