class PagesController < ApplicationController
  allow_unauthenticated_access only: [ :home ]
  def home
    @activities = Activity.all
    @events = Event.upcoming
    @galleries = Gallery.all
  end
end
