class SessionsController < ActionController::Base
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path  
    else
      # @error = "authentication failed."
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to action: 'new'
  end
end
