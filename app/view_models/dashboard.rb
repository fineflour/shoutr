class Dashboard
  def initialize(user)
    @user = user
  end

  def timeline
    @timeline = Timeline.new(timeline_users)
  end

  private
    attr_reader :user
  def timeline_users
#    binding.pry
    user.followed_users + [user]
  end
end
