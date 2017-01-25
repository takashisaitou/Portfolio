class HomeController < ApplicationController
  def top
    @post = Post.new
    @posts = Post.all.order(created_at: :desc)
    @users = User.all
    # @gardens = Garden.all
    @q = Place.search(params[:q])
    @places = @q.result(distinct: true)
    # @places = Place.all
    @posts = Post.page(params[:page]).per(5).order(created_at: :desc)
    @hash = Gmaps4rails.build_markers(@places) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      marker.infowindow place.description
      marker.json({title: place.title})
    end
  end
end
