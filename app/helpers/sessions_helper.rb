module SessionsHelper

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session[:user_id] = nil
  end

  def after_sign_in(to_url = nil)
    redirect_url = to_url.blank? ? root_path : to_url.to_s
    redirect_to redirect_url, notice: "Welcome, you've logged in."
  end

  def after_sign_out
    redirect_to root_path, notice: "You've logged out."
  end

end
