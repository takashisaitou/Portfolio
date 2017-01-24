class GardensController < ApplicationController
  before_action :set_garden, only: [:show, :edit, :update, :destroy]

  def new
    @garden = Garden.new
  end

  def show
  end

  def index
    @gardens = Garden.all
  end

  def edit
  end

  def create
    @place=Place.new
    @place.save
    #@garden = Garden.new(garden_params)
    @garden = @place.gardens.build(garden_params)
    if @garden.save
      redirect_to gardens_path, notice: "投稿が保存されました"
    else
      render :new
    end
  end

  def update
    if @garden.update(garden_params)
      redirect_to @garden, notice: "投稿が更新されました"
    else
      render :edit
    end
  end

  def destroy
    @garden.destroy
    redirect_to gardens_path
  end

  private

    def set_garden
      @garden = Garden.find(params[:id])
    end

    def garden_params
      params.require(:garden).permit(:name, :herb, :content, :cropyields)
    end
end
