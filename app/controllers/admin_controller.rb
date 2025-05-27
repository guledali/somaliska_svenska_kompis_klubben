class AdminController < ApplicationController
  before_action :require_admin

  def index
    @activities = Activity.all
    @events = Event.all
    @contacts = Contact.all
    @galleries = Gallery.all
  end

  private

  def require_admin
    unless authenticated? && Current.user.email_address == "admin@example.com"
      redirect_to root_path, alert: "You must be an admin to access this page."
    end
  end
end
