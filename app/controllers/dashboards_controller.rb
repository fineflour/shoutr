class DashboardsController < ApplicationController
  def show
    #@timeline = Timeline.new(current_user.followed_users + [current_user])
    @dashboard = Dashboard.new(current_user)
  end
end
