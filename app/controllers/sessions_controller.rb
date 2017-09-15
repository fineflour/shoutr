class SessionsController < ApplicationController
  private

  def authenticate(_)
    super(session_params)
  end

  def session_params
    { session: session_params_with_email }
  end

  def session_params_with_email
    params.require(:session).permit(:password).merge(email: user.email)
  end

  def user
    User.where(email: email_or_username).or(User.where(username: email_or_username)).first || Guest.new
  end

  def email_or_user_name
    params[:session][:email_or_username]
  end
end
