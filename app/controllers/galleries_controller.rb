class GalleriesController < ApplicationController
  before_action :require_current_user

  respond_to :json

  def index
    @galleries = @current_user.galleries
    respond_with @galleries
  end

  def create
    @gallery = Gallery.new(gallery_params)
    @gallery.user = @current_user
    @gallery.save
    respond_with @gallery
  end

  def show
    @gallery = Gallery.find(params[:id])
    respond_with @gallery
  end

  private

  def gallery_params
    params.require(:gallery).permit(:name)
  end
end
