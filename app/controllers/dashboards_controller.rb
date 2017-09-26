class DashboardsController < ApplicationController
  def show
    @shout = Shout.new
    @shouts = current_user.timeline_shouts
  end
end
