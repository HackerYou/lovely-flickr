class PhotosController < ApplicationController
  before_action :require_current_user, except: [:index, :show, :search]

  respond_to :html, :json, :xml, except: [:new]

  def index
    @photos = Photo.paginate(:page => params[:page], :per_page => 3)

    respond_with @photos
  end

  def show
    @photo = Photo.find(params[:id])
    respond_with @photo
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user = @current_user
    @photo.save

    redirect_to photo_path(@photo)
  end

  def search
    @results = Photo.search_for params[:query]
    respond_with @results
  end

  def buy
    customer = Stripe::Customer.create(
      email: params[:email],
      card: params[:stripeToken]
    )

    Stripe::Charge.create(
      customer: customer.id,
      amount: Photo::PRICE,
      currency: 'cad'
    )
  rescue Stripe::CardError => error
      flash[:error] = error.message
      redirect_to photo_path(params[:id])
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to photos_path }
      format.json { respond_with @photo }
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :description, :upload, :upload_url)
  end
end
