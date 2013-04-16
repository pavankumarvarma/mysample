class SessionsController < ApplicationController
  def new
end

def create
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    session[:email] = user.email
    redirect_to(blog_view_path)
  else
    flash.now.alert = "Invalid email or password"
    render "new"
  end
end

def destroy
  session[:user_id] = nil
  redirect_to(log_in_path) #:back, :notice => "Logged out!"
end

end
