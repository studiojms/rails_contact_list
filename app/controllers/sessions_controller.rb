class SessionsController < ApplicationController
  def new
    redirect_to user_path(current_user) if user_signed_in?
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      sign_in(user)
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email or password'
      render 'new'
    end
  end

  def destroy
    sign_out
    flash[:success] = 'Successfully logged out'
    redirect_to signin_path
  end
end
