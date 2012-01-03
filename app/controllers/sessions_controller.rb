class SessionsController < ApplicationController

  def new
    @title = "Sign in"
  end

  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid email/password combination."
      @title = "Sign in"
      render 'new'
      # Create an error message and re-render the signin form.
    else
      # Sign the user in and redirect to the user's show page.
      sign_in user
     redirect_back_or user
    end
  end

  def destroy

    sign_out
    redirect_to root_path

  end
  def deny_access
    redirect_to signin_path, :notice => "Please sign in to access this page."
  end

end
