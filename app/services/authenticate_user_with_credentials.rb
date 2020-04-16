class AuthenticateUserWithCredentials < AuthenticateUser
  def initialize(login, password)
  	super()
    @login = login
    @password = password
  end
  
  def authenticate
    user = User.find_by(login: @login)
    @user = user if user && user.authenticate(@password)
    !@user.nil?
  end
end
