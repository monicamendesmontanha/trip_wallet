class SessionsController < ApplicationController

  def login
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      redirect_to user
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination'
      render 'login'
    end

  end

  def destroy
    log_out
    redirect_to root_url
  end

end



# Possible results of user && user.authenticate(…).
# ___________________________________________________
#User            	Password                  	a && b
#nonexistent	      anything          	(nil && [anything]) == false
#valid user     	wrong password          	(true && false) == false
#valid user    	right password            	(true && true) == true