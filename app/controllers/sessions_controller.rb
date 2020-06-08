class SessionsController < ApplicationController
  # GET /login
  def new
  end

  # POST login
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_back_or user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  # DELETE /logout
  def destroy
    log_out
    # 慣習的に root_path ではなく、root_url と記載している
    redirect_to root_url
  end
end
