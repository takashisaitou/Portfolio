class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  before_action :set_user,  only: [:show, :edit, :update, :top]
  before_action :authenticate_user!

  def index
    # @users = User.all
    @users = User.page(params[:page]).per(10).all
  end

  def show
    @posts = @user.posts.page(params[:page]).per(2).order(created_at: :desc)
    # @posts = Post.page(params[:page]).per(2).order(created_at: :desc)
  end

  def edit
  end

  def update
    file = params[:user][:image]
    @user.set_image(file)

    if @user.update(user_params)
      redirect_to @user, notice: 'ユーザー情報が更新されました'
    else
      render :edit
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :email, :department)
    end

    def correct_user
      user = User.find(params[:id])
      if !current_user?(user)
        redirect_to root_path, alert: '許可されていないページです'
      end
    end
end
