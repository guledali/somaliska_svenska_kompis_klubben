class PagesController < ApplicationController
  def home
    @activities = Activity.all
    @events = Event.upcoming
    @galleries = Gallery.all
  end
end
