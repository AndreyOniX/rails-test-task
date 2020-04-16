class SessionsController < ApplicationController

  include SessionsHelper

  def new
  end

  def create
    authenticator = AuthenticateUserWithCredentials.new(params[:login], params[:password])
    if authenticator.authenticate
      sign_in authenticator.user
      after_sign_in
    else
      flash.now[:alert] = 'Email or password is invalid'
      render 'new'
    end
  end

  def destroy
    sign_out
    after_sign_out
  end

end
