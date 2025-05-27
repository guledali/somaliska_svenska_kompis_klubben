class GalleriesController < ApplicationController
  before_action :set_gallery, only: [ :show, :edit, :update, :destroy ]
  before_action :require_admin, except: [ :show ]

  def index
    @galleries = Gallery.all
  end

  def show
  end

  def new
    @gallery = Gallery.new
  end

  def edit
  end

  def create
    @gallery = Gallery.new(gallery_params)

    if @gallery.save
      redirect_to admin_path, notice: "Gallery item was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @gallery.update(gallery_params)
      redirect_to admin_path, notice: "Gallery item was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @gallery.destroy
    redirect_to admin_path, notice: "Gallery item was successfully deleted."
  end

  private

  def set_gallery
    @gallery = Gallery.find(params[:id])
  end

  def gallery_params
    params.require(:gallery).permit(:title, :description, :image_url)
  end

  def require_admin
    unless authenticated? && Current.user.email_address == "admin@example.com"
      redirect_to root_path, alert: "You must be an admin to access this page."
    end
  end
end
