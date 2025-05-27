class ActivitiesController < ApplicationController
  before_action :set_activity, only: [ :show, :edit, :update, :destroy ]
  before_action :require_admin, except: [ :show ]

  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find_by!(slug: params[:id])
  end

  def new
    @activity = Activity.new
  end

  def edit
  end

  def create
    @activity = Activity.new(activity_params)

    if @activity.save
      redirect_to admin_path, notice: "Activity was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @activity.update(activity_params)
      redirect_to admin_path, notice: "Activity was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @activity.destroy
    redirect_to admin_path, notice: "Activity was successfully deleted."
  end

  private

  def set_activity
    @activity = Activity.find_by!(slug: params[:id])
  end

  def activity_params
    params.require(:activity).permit(:title, :description, :icon, :image, :schedule)
  end

  def require_admin
    unless authenticated? && Current.user.email_address == "admin@example.com"
      redirect_to root_path, alert: "You must be an admin to access this page."
    end
  end
end
